package com.goodfriend.daomanager.test;

import static org.junit.Assert.fail;

import java.sql.Timestamp;
import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.dao.IItemDAO;
import com.goodfriend.daomanager.IAlbumDaoManager;
import com.goodfriend.daomanager.IUserDaoManager;
import com.goodfriend.model.Album;
import com.goodfriend.model.Item;
import com.goodfriend.model.Picture;

public class AlbumDaoManagerTest {
	
	private IAlbumDaoManager albumDaoManager;
	private IUserDaoManager userDaoManager;
	private IItemDAO itemDao;
	private ApplicationContext ctx;
	
	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans-test.xml");
		albumDaoManager = (IAlbumDaoManager) ctx.getBean("albumDaoManager");
		userDaoManager = (IUserDaoManager) ctx.getBean("userDaoManager");
		itemDao = (IItemDAO) ctx.getBean("itemDAO");
	}

	@After
	public void tearDown() throws Exception {
		albumDaoManager = null;
		ctx = null;
	}

	@Test
	public void testAddAlbum() {
		Album album = new Album();
		Item item1 = new Item();
		item1.setRecordTime(new Timestamp(new Date().getTime()));
		item1.setUser(userDaoManager.getUser(1));
		itemDao.save(item1);
		for (int i = 0; i < 5; i++) {
			Picture picture = new Picture();
			picture.setAlbum(album);
			picture.setIntroduction("picture" + i);
			picture.setItem(item1);
			picture.setPath("D:\\fsdf\\dfsf\\p" + i + ".jpg");
			picture.setAlbum(album);
		}
		album.setItem(item1);
		album.setCover("ttddy");
		albumDaoManager.addAlbum(album);
	}

	@Test
	public void testDeleteAlbum() {
		Album album_delete = albumDaoManager.getAllAlbums().get(0);
		album_delete.setPictures(null);
		albumDaoManager.deleteAlbum(album_delete);
	}

	@Test
	public void testGetAlbumByProperty() {
		Album album = new Album();
		Item item1 = new Item();
		item1.setRecordTime(new Timestamp(new Date().getTime()));
		item1.setUser(userDaoManager.getUser(1));
		itemDao.save(item1);
		for (int i = 0; i < 5; i++) {
			Picture picture = new Picture();
			picture.setAlbum(album);
			picture.setIntroduction("picture" + i);
			picture.setItem(item1);
			picture.setPath("D:\\fsdf\\dfsf\\p" + i + ".jpg");
		}
		Item item2 = new Item();
		item2.setRecordTime(new Timestamp(new Date().getTime()));
		item2.setUser(userDaoManager.getUser(1));
		itemDao.save(item2);
		album.setItem(item2);
		album.setCover("tty");
		albumDaoManager.addAlbum(album);
	}

	@Test
	public void testGetAllAlbums() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateAlbum() {
		fail("Not yet implemented");
	}

	@Test
	public void testSetAlbumDao() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAlbumDao() {
		fail("Not yet implemented");
	}

}
