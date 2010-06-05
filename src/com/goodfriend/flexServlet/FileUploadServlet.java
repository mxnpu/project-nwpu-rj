package com.goodfriend.flexServlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.goodfriend.dao.impl.AlbumDAO;
import com.goodfriend.dao.impl.MailDAO;
import com.goodfriend.model.User;

public class FileUploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private WebApplicationContext wc;

	private AlbumDAO albumDAO;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();

		int userID = Integer.parseInt(request.getParameter("id"));
		String group = request.getParameter("group");
		
		wc = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		fileUpload.setSizeMax(1024 * 1024 * 1024);
		// 使可以识别中文文件名
		fileUpload.setHeaderEncoding("utf-8");
		// request.setCharacterEncoding("utf-8");
		try {
			List items = fileUpload.parseRequest(request);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();

				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					// System.out.println(name + ":" + value);
				} else {
					String fieldName = item.getFieldName();
					String fileName = item.getName();
					String contentType = item.getContentType();
					boolean isInMemory = item.isInMemory();
					long sizeInBytes = item.getSize();

					String path = getServletContext().getRealPath("/")
							+ "pictures\\" + userID + "_" + fileName;
					
					// 保存图片到服务器 保存的时候加上用户名 以便区别各个用户上传的图片
					File uploadedFile = new File(path);
					item.write(uploadedFile);

					// 保存图片到工程 以后可以去掉
					// File temp = new
					// File("D:/My Documents/WebProject/WebRoot/pictures/" +
					// userID + "_" + fileName);
					// item.write(temp);
					albumDAO = (AlbumDAO)wc.getBean("albumDAO");
					group = group.split("\\?")[0];
					path = userID + "_" + fileName;
					albumDAO.saveImage(userID, group, path);
					System.out.println("上传成功！");
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("上传 失败！");
			e.printStackTrace();

		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			doPost(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}