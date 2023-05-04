<<<<<<< HEAD
/*
 * package util.upload;
 * 
 * import java.io.File; import java.io.IOException; import java.util.UUID;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.MultipartConfig; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import com.oreilly.servlet.multipart.Part;
 * 
 * @WebServlet("/upload")
 * 
 * @MultipartConfig public class uploadController extends HttpServlet {
 * 
 * 
 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException {
 * 
 * UUID uuid=UUID.randomUUID();
 * 
 * String savePath = getServletContext().getRealPath("/") + "images/"; File
 * saveDir = new File(savePath); if (!saveDir.exists()) { saveDir.mkdir(); }
 * Part part = req.getPart("image"); String fileName =
 * part.getSubmittedFileName(); part.write(savePath + fileName); } }
 */
=======
//package util.upload;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.UUID;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.oreilly.servlet.multipart.Part;
//
//@WebServlet("/upload")
//@MultipartConfig
//public class uploadController extends HttpServlet {
//	
//	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		UUID uuid=UUID.randomUUID();
//		
//		 String savePath = getServletContext().getRealPath("/") + "images/";
//	        File saveDir = new File(savePath);
//	        if (!saveDir.exists()) {
//	            saveDir.mkdir();
//	        }
//	        Part part = req.getPart("image");
//	        String fileName = part.getSubmittedFileName();
//	        part.write(savePath + fileName);
//	    }
//	}
>>>>>>> 047ffa544bcf660aa800b221f7271048b2e8df06
