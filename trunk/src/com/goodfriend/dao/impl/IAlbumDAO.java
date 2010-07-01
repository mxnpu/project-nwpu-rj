/**
 * 
 */
package com.goodfriend.dao.impl;

import java.util.List;

import com.goodfriend.dao.impl.UserDAO;
import com.goodfriend.model.Album;
import com.goodfriend.model.flex.FAlbum;
import com.goodfriend.model.flex.FItem;

/**
 * @author lenovo
 *
 */
public interface IAlbumDAO {

    public abstract void save(Album transientInstance);

    public abstract void delete(Album persistentInstance);

    public abstract Album findById(java.lang.Integer id);

    @SuppressWarnings("unchecked")
    public abstract List<Album> findByExample(Album instance);

    @SuppressWarnings("unchecked")
    public abstract List<Album> findByProperty(String propertyName, Object value);

    public abstract List<Album> findByTitle(Object title);

    @SuppressWarnings("unchecked")
    public abstract List<Album> findAll();

    public abstract Album merge(Album detachedInstance);

    public abstract void attachDirty(Album instance);

    public abstract void attachClean(Album instance);

    public abstract void saveAlbumFlex(FAlbum fAlbum, FItem fItem);

    //新建一个相册
    public abstract void createAlbum(int userID, String title);

    //获得一个用户的所有相册名称
    public abstract List<String> getAlbumTitles(int userID);

    //保存一张图片到数据库
    public abstract void saveImage(int userID, String groupName, String path);

    //根据相册名称返回相册中的所有图片
    public abstract List<Album> getImagesByAlbumName(int userID,
	    String albumName);

    //根据相册名删除相册  把该相册下的所有图片转移到default album相册下
    public abstract void removeAlbum(int userID, String albumName);

    //删除一张图片信息
    public abstract void deleteImage(int userID, String albumName, String path);

    //更新图片描述
    public abstract void updateDescription(int userID, String albumName,
	    String path, String description);

    //改变一张图片所属的相册
    public abstract void moveImage(int userID, String fromAlbum,
	    String toAlbum, String path);

    public abstract UserDAO getUserDAO();

    public abstract void setUserDAO(UserDAO userDAO);

}