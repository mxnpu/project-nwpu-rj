/**
 * 
 */
package com.goodfriend.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.goodfriend.model.User;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

/**
 * Process the request of the file upload.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.18
 * @LastModifyTime 2010.05.20
 */
public class FileUploadAction {
    /* the file to upload */
    private File photo;
    /* the name of the file to upload */
    private String photoFileName;
    /* the MIME type of the file to upload */
    private String photoContentType;

    /* the path of the file in the server system. */
    private String uploadDir;
    
    private IUserService userService;
    private Map<String, Object> session;

    /**
     * The method to process the file upload action.
     * 
     * @return
     * @throws Exception
     */
    public String upload() throws Exception {
	
	String newFileName = null;
	/* get a time as the new file name */
	long now = new Date().getTime();

	/* get the direction of the file in the server system */
	String path = ServletActionContext.getServletContext().getRealPath(
		uploadDir);
	File dir = new File(path);
	if (!dir.exists()) {
	    dir.mkdir();
	}

	int index = photoFileName.lastIndexOf('.');
	/* judge the file has the extentance name. */
	if (index != -1) {
	    newFileName = now + photoFileName.substring(index);
	} else {
	    newFileName = Long.toString(now);
	}

	BufferedOutputStream bos = null;
	BufferedInputStream bis = null;

	try {
	    FileInputStream fis = new FileInputStream(photo);
	    bis = new BufferedInputStream(fis);
	    FileOutputStream fos = new FileOutputStream(new File(dir,
		    newFileName));
	    bos = new BufferedOutputStream(fos);

	    byte[] buffer = new byte[4096];
	    int length = -1;
	    while ((length = bis.read(buffer)) != -1) {
		bos.write(buffer, 0, length);
	    }
	} catch (IOException ioe) {
	    ioe.printStackTrace();
	} finally {
	    try {
		if (null != bis) {
		    bis.close();
		}
	    } catch (IOException e) {
		e.printStackTrace();
	    }
	    try {
		if (null != bis) {
		    bos.close();
		}
	    } catch (IOException e) {
		e.printStackTrace();
	    }
	}
	
	// Update the current user's photo address
	session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");
	String photo = ".." + uploadDir + "/" + newFileName;
	User user = userService.getUser(currentUser.getUserName());
	user.setPhoto(photo);
	userService.updateUser(user);
	session.put("currentUser", user);
	

	return "success";
    }

    /**
     * @param uploadDir
     *            the uploadDir to set
     */
    public void setUploadDir(String uploadDir) {
	this.uploadDir = uploadDir;
    }

    /**
     * @return the uploadDir
     */
    public String getUploadDir() {
	return uploadDir;
    }

    /**
     * @param photo the photo to set
     */
    public void setPhoto(File photo) {
	this.photo = photo;
    }

    /**
     * @return the photo
     */
    public File getPhoto() {
	return photo;
    }

    /**
     * @param photoFileName the photoFileName to set
     */
    public void setPhotoFileName(String photoFileName) {
	this.photoFileName = photoFileName;
    }

    /**
     * @return the photoFileName
     */
    public String getPhotoFileName() {
	return photoFileName;
    }

    /**
     * @param photoContentType the photoContentType to set
     */
    public void setPhotoContentType(String photoContentType) {
	this.photoContentType = photoContentType;
    }

    /**
     * @return the photoContentType
     */
    public String getPhotoContentType() {
	return photoContentType;
    }

    /**
     * @param userService the userService to set
     */
    public void setUserService(IUserService userService) {
	this.userService = userService;
    }

    /**
     * @return the userService
     */
    public IUserService getUserService() {
	return userService;
    }

}
