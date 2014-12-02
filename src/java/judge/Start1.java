/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package judge;

import java.io.*;
import java.net.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author vishwesh
 */
public class Start1 extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        int totalProblems = 0;
        try {
            totalProblems = (Integer) getServletContext().getAttribute("totalProblems");
            //out.println("string :" + totalProblems);
        //int totalProblems = Integer.parseInt(str);
        } catch (Exception ne) {
            out.println(ne);
            ne.printStackTrace();
        }

        //to get the content type information from JSP Request Header
        String contentType = request.getContentType();
        //out.println("ct:" + contentType + "<br>");
        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {

            DataInputStream in = new DataInputStream(request.getInputStream());
            //we are taking the length of Content type data
            int formDataLength = request.getContentLength();
            byte[] dataBytes = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            //this loop converting the uploaded file into byte code
            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }

            String file = new String(dataBytes);

           // out.println("<br>xxx" + file + "<br>");

            /* 
            //for saving the file name
            String saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            try {
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            } catch (Exception e) {
            out.println("chk error");
            }
            out.println("<br>savefile : " + saveFile + "<br>"); */

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

            //finding parent directory of docroot

            String instanceRoot = System.getProperty("com.sun.aas.instanceRoot");
            String docroot = instanceRoot + "\\docroot";
           
            FileOutputStream fileOut = new FileOutputStream(new File(docroot, "questions.zip"));
            fileOut.write(dataBytes, startPos, endPos - startPos);

            fileOut.flush();
            fileOut.close();

            //creating soLution folder

            File f = new File(docroot,"soLution");
            f.mkdir();
            for (int i = 1; i <= totalProblems; ++i) {
                new File(docroot + "\\soLution", i + "").mkdir();

                // writing in.txt

                pos = file.indexOf("in" + i, pos);

                pos = file.indexOf("filename=\"", pos);
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;


                int lastIndex1 = contentType.lastIndexOf("=", pos);
                String boundary1 = contentType.substring(lastIndex1 + 1, contentType.length());

                int boundaryLocation1 = file.indexOf(boundary1, pos) - 4;
                int startPos1 = ((file.substring(0, pos)).getBytes()).length;
                int endPos1 = ((file.substring(0, boundaryLocation1)).getBytes()).length;

                FileOutputStream fileOut1 = new FileOutputStream(new File(docroot + "\\soLution\\" + i, "in.txt"));
                fileOut1.write(dataBytes, startPos1, endPos1 - startPos1);

                fileOut1.flush();
                fileOut1.close();

                // writing out.txt

                pos = file.indexOf("out" + i, pos);

                pos = file.indexOf("filename=\"", pos);
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;


                int lastIndex2 = contentType.lastIndexOf("=", pos);
                String boundary2 = contentType.substring(lastIndex2 + 1, contentType.length());

                int boundaryLocation2 = file.indexOf(boundary2, pos) - 4;
                int startPos2 = ((file.substring(0, pos)).getBytes()).length;
                int endPos2 = ((file.substring(0, boundaryLocation2)).getBytes()).length;

                FileOutputStream fileOut2 = new FileOutputStream(new File(docroot + "\\soLution\\" + i, "out.txt"));
                fileOut2.write(dataBytes, startPos2, endPos2 - startPos2);

                fileOut2.flush();
                fileOut2.close();

            }
            response.sendRedirect("adminPage.jsp");
        }
    }
}
