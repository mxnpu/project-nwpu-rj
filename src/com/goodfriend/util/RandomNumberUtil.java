package com.goodfriend.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

public class RandomNumberUtil {

	private static final int HEIGHT = 20;
	private static final int WIDTH = 85;

	private ByteArrayInputStream image; // 图像
	private String str; // 验证码

	private RandomNumberUtil() {
		init();// 初始化属性
	}

	/**
	 * Get a RandomNumberUtil instance.
	 */
	public static RandomNumberUtil getInstance() {
		return	new RandomNumberUtil();
	}

	/*
	 * 取得验证码图片
	 */
	public ByteArrayInputStream getImage() {
		return this.image;
	}

	/*
	 * 取得图片的验证码
	 */
	public String getString() {
		return this.str;
	}

	/**
	 * 初始化函数
	 */
	private void init() {
		// 在内存中创建图象
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT,
				BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 生成随机类
		Random random = new Random();
		// 设定背景色
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		// 设定字体
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		// 随机产生168条干扰线，使图象中的认证码不易被其它程序探测到
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 168; i++) {
			int x = random.nextInt(WIDTH - 1);
			int y = random.nextInt(HEIGHT - 1);
			int xl = random.nextInt(6);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		for (int i = 0; i < 168; i++)  
        {  
            int x = random.nextInt(WIDTH - 1);  
            int y = random.nextInt(HEIGHT - 1);  
            int xl = random.nextInt(12) + 1;  
            int yl = random.nextInt(6) + 1;  
            g.drawLine(x, y, x - xl, y - yl);  
        }   
		// 取随机产生的认证码(6位数字)
		StringBuffer sRand = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			String tmp = getRandomChar();   
			sRand.append(tmp);
			// 将认证码显示到图象中
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.drawString(tmp, 13 * i + 6, 16);
		}
		// 赋值验证码
		this.str = sRand.toString();

		// 图象生效
		g.dispose();
		ByteArrayInputStream input = null;
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		try {
			ImageOutputStream imageOut = ImageIO
					.createImageOutputStream(output);
			ImageIO.write(image, "JPEG", imageOut);
			imageOut.close();
			input = new ByteArrayInputStream(output.toByteArray());
		} catch (Exception e) {
			System.out.println("验证码图片产生出现错误：" + e.toString());
		}

		this.image = input;/* 赋值图像 */
	}

	/**
	 * 随机生成字符
	 * 
	 * @return 随机生成的字符
	 */
	private String getRandomChar() {
		int rand = (int) Math.round(Math.random() * 2);  
        long itmp = 0;  
        char ctmp = '\u0000';  
        switch(rand)  
        {  
        //生成大写字母的情形  
        case 1:  
            itmp = Math.round(Math.random() * 25 + 65);  
            ctmp = (char) itmp;  
            return String.valueOf(ctmp);  
        //生成小写字母的情形  
        case 2:  
            itmp = Math.round(Math.random() * 25 + 97);  
            ctmp = (char) itmp;  
            return String.valueOf(ctmp);  
        //生成数字的情形  
        default:  
            itmp = Math.round(Math.random() * 9);  
            return String.valueOf(itmp);  
        }    
	}

	/**
	 * 给定范围获得随机颜色
	 * 
	 * @param begin
	 *            开始边界
	 * @param end
	 *            结束边界
	 */
	private Color getRandColor(int begin, int end) {
		Random random = new Random(); // Get a random instance.
		if (begin > 255) {
			begin = 255;
		}
		if (end > 255) {
			end = 255;
		}
		int r = begin + random.nextInt(end - begin);
		int g = begin + random.nextInt(end - begin);
		int b = begin + random.nextInt(end - begin);
		return new Color(r, g, b);
	}
}
