/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package judge;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Properties;

/**
 *
 * @author vishwesh
 */
public class Upload extends HttpServlet {

    static String totalmemory = "";
    static String executiontime = "";
    static PrintWriter out = null;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Connection cn;
        Statement st;
        ResultSet rs;
        int tno = 0, count = 0, check = 0, solved = 1, solved1 = 0;
        String college = "", pid = "";
        Time t2 = null;
        Date d2 = null;

        out = response.getWriter();

        // pid = request.getParameter("pid");
        HttpSession session = request.getSession(true);
        String teamid = (String) session.getAttribute("user");
        String result = "";

        //to get the content type information from JSP Request Header
        String contentType = request.getContentType();

        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {

            DataInputStream in = new DataInputStream(request.getInputStream());

            //we are taking the length of Content type data
            int formDataLength = request.getContentLength();
            byte[] dataBytes = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;

            if (formDataLength > 50400) {
                out.println("<script language='JavaScript'> " +
                        "alert('Your source file size crossed the limit.It must be less than 50000 bytes.');" +
                        "location.href='home.jsp'" +
                        "</script>");
            }
            //this loop converting the uploaded file into byte code
            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }

            String file = new String(dataBytes);

            // extracting the pid parameter *** important ****

            pid = file.substring(file.indexOf("pid") + 8);// pid is Program id.
            pid = (String) pid.substring(0, 1);
            pid = new String(pid.toCharArray());

            //getting language parameter            

            String language = ""; //= request.getParameter("lang");
            language = file.substring(file.indexOf("lang") + 6);
            language = language.substring(0, 8).trim();
            language = new String(language.toCharArray());

            //out.println("language1=" + language + "*");


            //for saving the file name
            String saveFile = file.substring(file.indexOf("filename=\"") + 10);


            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            try {
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            } catch (Exception e) {
                out.println("chk error");
            }

            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());
            int pos;
            //extracting the index of file
            
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

            // creating a new file with the same name and writing the content in new file

            java.util.Date today = new java.util.Date();

            java.sql.Time t = new java.sql.Time(today.getTime());
            java.sql.Date d = new java.sql.Date(today.getTime());


            // To print all System properties
        /*    Properties p = System.getProperties();
            java.util.Enumeration keys = p.keys();
            while (keys.hasMoreElements()) {
            String key = (String) keys.nextElement();
            String value = (String) p.get(key);
            out.println(key + ": " + value + "<br>");
            }
             */

            // Getting the docroot of glassfish server <Documents Directory>

            String instanceRoot = System.getProperty("com.sun.aas.instanceRoot");
            String docroot = instanceRoot + "\\docroot";

            File dir0 = new File(docroot, "uploads");
            dir0.mkdir();

            String docroot1 = docroot + "\\uploads";

            File dir = new File(docroot1, teamid);
            dir.mkdir();
            docroot1 += "\\" + teamid;
            File dir1 = new File(docroot1, pid);
            dir1.mkdir();
            docroot1 += "\\" + pid;
            //String tString = t.getHours() + "_" + t.getMinutes() + "_" + t.getSeconds() + "";
            java.util.Calendar cal = java.util.Calendar.getInstance();
            String tString = cal.get(java.util.Calendar.YEAR) + "_" + (cal.get(java.util.Calendar.MONTH) + 1) + "_" + cal.get(java.util.Calendar.DAY_OF_MONTH) + "_" + cal.get(java.util.Calendar.HOUR_OF_DAY) + "_" + cal.get(java.util.Calendar.MINUTE) + "_" + cal.get(java.util.Calendar.SECOND) + "_" + cal.get(java.util.Calendar.MILLISECOND);
            out.println(" DateString=" + tString + " * ");
            File dir2 = new File(docroot1, tString);
            dir2.mkdir();
            docroot1 += "\\" + tString;
            FileOutputStream fileOut = new FileOutputStream(new File(docroot1, saveFile));
            fileOut.write(dataBytes, startPos, endPos - startPos);
            out.println("Current dir = " + dir.getAbsolutePath());
            fileOut.flush();
            fileOut.close();
            //out.println("savefile : " + saveFile + "<br>");
            //Updating uploadStatus variable as successful
            session.setAttribute("uploadStatus", "1");
            // Updating Database
            out.println("\n teamid : " + teamid + " " + college + " " + pid + " " + result + t);
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                cn = DriverManager.getConnection("jdbc:odbc:sp");
                st = cn.createStatement();
                String q1 = "select * from student where tid='" + teamid + "'";
                rs = st.executeQuery(q1);
                rs.next();
                college = rs.getString(4);
                cn.close();
            } catch (Exception e) {
                out.println(e);
            }
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                cn = DriverManager.getConnection("jdbc:odbc:sp");
                st = cn.createStatement();
                String pathDir = dir.getAbsolutePath() + "\\" + pid + "\\" + tString;
                //*********calling compile method ***************
                //pathDir : directory containing uploaded file, src : uploaded file without extension,
                //3rd parameter is the directory containing solution (e.g. "C:\Sun\AppServer\domains\domain1\config\soLution\2")
                //4th parameter is the name of original output file
                //5th parameter is programming language of uploaded source code < take it from database >
                result += compile(pathDir, saveFile, docroot + "\\soLution" + "\\" + pid, "out.txt", language);
                out.println(teamid + college + pid + result + t);
                out.println("<br>1=" + pathDir + "<br>2=" + saveFile + "<br>3=" + docroot + "\\soLution" + "\\" + pid + "<br>4=out.txt <br>5=" + language);
                tno++;
                String q = "insert into status values ('" + teamid + "','" + college + "','" + pid + "','" + result + "','" + t + "'," + tno + ",'" + d + "','" + totalmemory + "','" + executiontime + "','" + language + "')";
                boolean ab = st.execute(q);
                cn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e + "AA");
            }

            //******* updating result table in database ****************
            if (result.equalsIgnoreCase("Accepted")) {
                //geting time of last accepted
                try {
                    cn = DriverManager.getConnection("jdbc:odbc:sp");
                    st = cn.createStatement();
                    String q2 = "select * from status where result='Accepted' and tid = '" + teamid + "' order by date1 desc, time desc";
                    rs = st.executeQuery(q2);
                    rs.next();
                    t2 = rs.getTime(5);
                    d2 = rs.getDate(7);
                    cn.close();
                } catch (Exception e1) {
                    e1.printStackTrace();
                    out.println(e1 + "cc");
                }
                //checking if team is solved any problem
                try {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    cn = DriverManager.getConnection("jdbc:odbc:sp");
                    st = cn.createStatement();
                    count = 0;
                    String q1 = "select * from result where tid = '" + teamid + "'";
                    rs = st.executeQuery(q1);
                    while (rs.next()) {
                        // solved1 = rs.getInt(3);
                        count++;
                    }
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(e + "dd");
                }
                // out.println("count=" + count);
                if (count == 0) {
                    //not present in result list so insert record
                    try {
                        cn = DriverManager.getConnection("jdbc:odbc:sp");
                        st = cn.createStatement();
                        String q4 = "insert into result values('" + teamid + "','" + college + "'," + solved + ",'" + t2 + "','" + d2 + "')";
                        rs = st.executeQuery(q4);
                        cn.close();
                    } catch (Exception e1) {
                        e1.printStackTrace();
                        out.println(e1 + "ee");
                    }
                } else {
                    //present hence update
                    //geting value of solved yet
                    try {
                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                        cn = DriverManager.getConnection("jdbc:odbc:sp");
                        st = cn.createStatement();
                        check = 0;
                        String q6 = "select * from status where tid='" + teamid + "' and  qname = '" + pid + "' and result = 'Accepted'";
                        rs = st.executeQuery(q6);
                        while (rs.next()) {
                            check++;
                        // out.println(rs.getString(3));
                        }
                        cn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println(e + "ff");
                    }
                    // out.println("check=" + check);
                    if (check <= 1) {
                        try {
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            cn = DriverManager.getConnection("jdbc:odbc:sp");
                            st = cn.createStatement();

                            String q6 = "select * from result where tid='" + teamid + "'";
                            rs = st.executeQuery(q6);
                            rs.next();
                            solved1 = rs.getInt(3);
                            cn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println(e + "gg");
                        }
                        //updating no of problems solved
                        try {
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            cn = DriverManager.getConnection("jdbc:odbc:sp");
                            st = cn.createStatement();

                            String q6 = "update result set LastAcceptTime = '" + t2 + "' where tid = '" + teamid + "'";
                            int k = st.executeUpdate(q6);
                            cn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println(e + "hh");
                        }
                        try {
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            cn = DriverManager.getConnection("jdbc:odbc:sp");
                            st = cn.createStatement();

                            String q6 = "update result set date1 = '" + d2 + "' where tid = '" + teamid + "'";
                            int k = st.executeUpdate(q6);
                            cn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println(e + "hh1");
                        }
                        try {
                            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            cn = DriverManager.getConnection("jdbc:odbc:sp");
                            st = cn.createStatement();
                            solved1++;
                            String q6 = "update result set solved = " + solved1 + " where tid = '" + teamid + "'";
                            int k = st.executeUpdate(q6);
                            cn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println(e + "ii");
                        }
                    }
                }
            }
            response.sendRedirect("Status.jsp");
        } else {
            out.println("Error <a href='home.jsp'> Back </a>");
        }
    }

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
        } 
        else if (lang.equalsIgnoreCase("c")) {
            try {
                System.out.println(" ** ");
                proc = runtime.exec("\"C:\\gcc\\bin\\gcc\" -fopenmp -o \"" + dir + "\\" + source + ".exe\" \"" + dir + "\\" + source + "\""); //C:\openmp>gcc -fopenmp -o c1.exe c1.c

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
                proc = runtime.exec("\"C:\\gcc\\bin\\g++\" -fopenmp -o \"" + dir + "\\" + source + ".exe\" \"" + dir + "\\" + source + "\"");

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
                    result += executeCpp(dir, source, outdir, outfile); //Executing the .exe file

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
        long counter = 0;
        while ((ch = bufferedreader.read()) != -1) {
            fw.append((char) ch);
            counter++;
            if (counter > 10000000) {
                result = "Time Limit Exceed";
                proc.destroy();
                return result;
            }
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
     static String executeCpp(String dir, String source, String outdir, String outfile) throws IOException {
        String result = "";
        System.out.println(" inside executeC ");
        Runtime runtime = Runtime.getRuntime();

        String instanceRoot = System.getProperty("com.sun.aas.instanceRoot");
        String path = instanceRoot + "\\docroot";

        //String d = System.getProperty("user.dir");
        //String path = (new File(d)).getAbsolutePath();

        System.out.println("cmd /c " + source + " < \"" + outdir + "\\in.txt\"");
        java.util.Date prevtime = new java.util.Date();
        Process proc = runtime.exec("cmd /c " + source + ".exe < \"" + outdir + "\\in.txt\"", null, new File(dir));

        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);

        int ch;
        FileWriter fw = new FileWriter(new File(dir + "\\" + "out.txt"));
        long counter = 0;
        while ((ch = bufferedreader.read()) != -1) {
            fw.append((char) ch);
            counter++;
            if (counter > 10000000) {
                result = "Time Limit Exceed";
                proc.destroy();
                return result;
            }
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
        out.println("<br> inside execute ");
        Runtime runtime = Runtime.getRuntime();

        String instanceRoot = System.getProperty("com.sun.aas.instanceRoot");
        String path = instanceRoot + "\\docroot";

        //String d = System.getProperty("user.dir");
        //String path = (new File(d)).getAbsolutePath();
        out.println("<br>cmd /c java " + source + " < \"" + outdir + "\\" + "in.txt\"");

        java.util.Date prevtime = new java.util.Date();
//\"C:\\Program Files\\Java\\jdk1.6.0_03\\bin\\
        Process proc = runtime.exec("cmd /c java " + source + " < \"" + outdir + "\\" + "in.txt\"", null, new File(dir));

        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        int ch;
        FileWriter fw = new FileWriter(new File(dir + "\\" + "out.txt"));
        long counter = 0;
        while ((ch = bufferedreader.read()) != -1) {
            fw.append((char) ch);
            counter++;
            if (counter > 10000000) {
                result = "Time Limit Exceed";
                proc.destroy();
                return result;
            }
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



