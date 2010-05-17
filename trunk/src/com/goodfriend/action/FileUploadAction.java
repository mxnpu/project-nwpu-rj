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

import org.apache.struts2.ServletActionContext;

/**
 * 
 * 
 * @author xurunhua
 * @time
 */
public class FileUploadAction {
    /* the file to upload */
    private File file;
    /* the name of the file to upload */
    private String fileName;
    /* the MIME type of the file to upload */
    private String fileContentType;

    /* the path of the file in the server system. */
    private String uploadDir;

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

	int index = fileName.lastIndexOf('.');
	/* judge the file has the extentance name. */
	if (index != -1) {
	    newFileName = now + fileName.substring(index);
	} else {
	    newFileName = Long.toString(now);
	}

	BufferedOutputStream bos = null;
	BufferedInputStream bis = null;

	try {
	    FileInputStream fis = new FileInputStream(file);
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

	return "success";
    }

    /**
     * @param file
     *            the file to set
     */
    public void setFile(File file) {
	this.file = file;
    }

    /**
     * @return the file
     */
    public File getFile() {
	return file;
    }

    /**
     * @param fileName
     *            the fileName to set
     */
    public void setFileName(String fileName) {
	this.fileName = fileName;
    }

    /**
     * @return the fileName
     */
    public String getFileName() {
	return fileName;
    }

    /**
     * @param fileContentType
     *            the fileContentType to set
     */
    public void setFileContentType(String fileContentType) {
	this.fileContentType = fileContentType;
    }

    /**
     * @return the fileContentType
     */
    public String getFileContentType() {
	return fileContentType;
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

}
