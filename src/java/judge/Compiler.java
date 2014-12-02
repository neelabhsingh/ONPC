/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package judge;

import java.io.*;

/**
 *
 * @author vishwesh
 */
public class Compiler {

    static String totalmemory = "-";
    static String executiontime = "-";

    static String compile(String dir, String source, String outdir, String outfile, String lang) throws IOException {
        totalmemory = "-";
        executiontime = "-";
        String result = "";
        Runtime runtime = Runtime.getRuntime();
        Process proc = null;
        System.out.println("<br>lang=" + lang);
        if (lang.equals("java")) {
            try {

                proc = runtime.exec("javac \"" + dir + "\\" + source + "\"");

                // writing the std err on the hard disk's file <it's necessary because 'due to less memory allocation to process on some platforms it may hang'>
                InputStream ins = proc.getErrorStream();
                InputStreamReader inr = new InputStreamReader(ins);
                //BufferedReader br = new BufferedReader(inr);

                FileOutputStream fout = new FileOutputStream(new File(dir + "\\Error.txt"));
                int ch;
                while ((ch = inr.read()) != -1) {
                    fout.write(ch);
                }
                fout.flush();
                fout.close();

                if (proc.waitFor() != 0) {
                    result += "Compilation Error";
                } else {

                    source = source.substring(0, source.indexOf(".")); //removing extension from source file name
                    result += execute(dir, source, outdir, outfile); //Executing the .classs file
                }
            } catch (InterruptedException e) {
                System.out.println(e);
            } catch (Exception e1) {
                System.out.println(e1);
            }
        } else if (lang.equalsIgnoreCase("c")) {
            try {
                System.out.println(" ** ");
                proc = runtime.exec("gcc -fopenmp -o \"" + dir + "\\" + source + ".exe\" \"" + dir + "\\" + source + "\""); //C:\openmp>gcc -fopenmp -o c1.exe c1.c

                InputStream ins = proc.getErrorStream();
                InputStreamReader inr = new InputStreamReader(ins);
                //BufferedReader br = new BufferedReader(inr);

                FileOutputStream fout = new FileOutputStream(new File(dir + "\\Error.txt"));
                int ch;
                while ((ch = inr.read()) != -1) {
                    fout.write(ch);
                }
                fout.flush();
                fout.close();

                if (proc.waitFor() != 0) {
                    result += "Compilation Error";
                } else {
                    // source = source.substring(0, source.indexOf(".")); //removing extension from source file name
                    result += executeC(dir, source, outdir, outfile); //Executing the .exe file                   
                }
            } catch (InterruptedException e) {
                System.out.println("interrupt" + e);
            } catch (Exception e1) {
                System.out.println("other exception" + e1);
            }
        } else if (lang.equalsIgnoreCase("cpp")) {
            try {
                proc = runtime.exec("g++ -fopenmp -o \"" + dir + "\\" + source + ".exe\" \"" + dir + "\\" + source + "\"");

                InputStream ins = proc.getErrorStream();
                InputStreamReader inr = new InputStreamReader(ins);
                //BufferedReader br = new BufferedReader(inr);

                FileOutputStream fout = new FileOutputStream(new File(dir + "\\Error.txt"));
                int ch;
                while ((ch = inr.read()) != -1) {
                    fout.write(ch);
                }
                fout.flush();
                fout.close();

                if (proc.waitFor() != 0) {
                    result += "Compilation Error";
                } else {
                    //source = source.substring(0, source.indexOf(".")); //removing extension from source file name
                    result += executeC(dir, source, outdir, outfile); //Executing the .exe file

                }
            } catch (InterruptedException e) {
                System.out.println(e);
            } catch (Exception e1) {
                System.out.println(e1);
            }
        } else {
            result += "File Format Error";
        }

        return result;
    }

    static String executeC(String dir, String source, String outdir, String outfile) throws IOException {
        String result = "";
        System.out.println(" inside executeC ");
        Runtime runtime = Runtime.getRuntime();

        String instanceRoot = System.getProperty("com.sun.aas.instanceRoot");
        String path = instanceRoot + "\\docroot";

        //String d = System.getProperty("user.dir");
        //String path = (new File(d)).getAbsolutePath();

        System.out.println("cmd /c " + source + ".exe < \"" + outdir + "\\in.txt\"");
        java.util.Date prevtime = new java.util.Date();
        Process proc = runtime.exec("cmd /c " + source + ".exe < \"" + outdir + "\\in.txt\"", null, new File(dir));

        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);

        int ch;
        FileWriter fw = new FileWriter(new File(dir + "\\" + "out.txt"));

        while ((ch = bufferedreader.read()) != -1) {
            fw.append((char) ch);
        //System.out.print((char)ch);
        }
        fw.close();
        try {
            if (proc.waitFor() != 0) {
                java.util.Date aftertime = new java.util.Date();
                long extime = aftertime.getTime() - prevtime.getTime();
                 executiontime = "" + extime / 1000000 + "." + extime % 1000000;
                System.out.println(" ** time= " + executiontime + "  seconds **");
                result += "Run Time Error";
            } else {
                java.util.Date aftertime = new java.util.Date();
                long extime = aftertime.getTime() - prevtime.getTime();
                executiontime = "" + extime / 1000000 + "." + extime % 1000000;
                System.out.println(" ** time= " + extime + " milliseconds **");
                result += test(dir, "out.txt", outdir, outfile); //source dir, user's output file,solution dir, solution file
            }
        } catch (InterruptedException e) {
            System.err.println(e);
        }

        totalmemory = "" + runtime.totalMemory() / 1000000 + "." + (runtime.totalMemory() % 1000000) / 1000;
        System.out.println("Memory Used=" + totalmemory + "MB");
        return result;
    }

    static String execute(String dir, String source, String outdir, String outfile) throws IOException {
        String result = "";
        System.out.println(" inside execute ");
        Runtime runtime = Runtime.getRuntime();

        String instanceRoot = System.getProperty("com.sun.aas.instanceRoot");
        String path = instanceRoot + "\\docroot";

        //String d = System.getProperty("user.dir");
        //String path = (new File(d)).getAbsolutePath();
        System.out.println("cmd /c java " + source + " < \"" + outdir + "\\" + "in.txt\"");

        java.util.Date prevtime = new java.util.Date();

        Process proc = runtime.exec("cmd /c java " + source + " < \"" + outdir + "\\" + "in.txt\"", null, new File(dir));

        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        int ch;
        FileWriter fw = new FileWriter(new File(dir + "\\" + "out.txt"));

        while ((ch = bufferedreader.read()) != -1) {
            fw.append((char) ch);
        //System.out.print((char)ch);
        }
        fw.close();
        try {
            if (proc.waitFor() != 0) {
                java.util.Date aftertime = new java.util.Date();
                long extime = aftertime.getTime() - prevtime.getTime();

                executiontime = "" + extime / 1000000 + "." + extime % 1000000;
                System.out.println(" ** time= " + extime + " in milliseconds **");

                result += "Run Time Error";
            } else {
                java.util.Date aftertime = new java.util.Date();
                long extime = aftertime.getTime() - prevtime.getTime();
                executiontime = "" + extime / 1000000 + "." + extime % 1000000;
                System.out.println(" ** time= " + extime + " in milliseconds **");

                result += test(dir, "out.txt", outdir, outfile); //source dir, user's output file,solution dir, solution file
            }
        } catch (InterruptedException e) {
            System.err.println(e);
        }
        long tm = runtime.totalMemory();
        totalmemory = "" + tm / 1000000 + "." + (tm % 1000000) / 1000;
        System.out.println("Memory Used=" + (tm) / 1000000.0 + "MB");
        return result;
    }

    static String test(String dir, String source, String outdir, String outfile) throws IOException {
        String result = "Wrong Answer";
        System.out.println(" inside test ");
        FileReader fr1 = new FileReader(new File(dir + "\\" + source));
        FileReader fr2 = new FileReader(new File(outdir + "\\" + outfile));

        BufferedReader br1 = new BufferedReader(fr1);
        BufferedReader br2 = new BufferedReader(fr2);
        String ch1;
        String ch2;
        boolean flag = true;
        while ((ch2 = br1.readLine()) != null && (ch1 = br2.readLine()) != null) {

            if (!ch1.equals(ch2)) {
                flag = false;
                break;
            }
        }
        if (flag && (ch2 = br1.readLine()) == null && (ch1 = br2.readLine()) == null) {
            result = "Accepted";
        }
        fr1.close();
        fr2.close();
        return result;
    }
}
