package com.sooncode.api.background.controller.project;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

/**
 * 文件操作
 * 
 * @author pc
 *
 */
public class FileUtil {
	/**
	 * 删除目录（文件夹）以及目录下的文件
	 * 
	 * @param sPath
	 *            被删除目录的文件路径
	 * @return 目录删除成功返回true，否则返回false
	 */
	public boolean deleteDirectory(String sPath) {
		// 如果sPath不以文件分隔符结尾，自动添加文件分隔符
		if (!sPath.endsWith(File.separator)) {
			sPath = sPath + File.separator;
		}
		File dirFile = new File(sPath);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			return false;
		}
		boolean flag = true;
		// 删除文件夹下的所有文件(包括子目录)
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				flag = deleteFile(files[i].getAbsolutePath());
				if (!flag)
					break;
			} // 删除子目录
			else {
				flag = deleteDirectory(files[i].getAbsolutePath());
				if (!flag)
					break;
			}
		}
		if (!flag)
			return false;
		// 删除当前目录
		if (dirFile.delete()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 删除文件
	 * @param sPath
	 * @return
	 */
	public boolean deleteFile(String sPath) {
		boolean flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}

	 

	/**
	 * 读文件
	 * 
	 * @param filePath
	 *            文件所在的路径
	 * @return 文件的内容
	 * @throws IOException
	 */
	public String readFile(String filePath) throws IOException {
		File file = new File(filePath);
		if (!file.exists() || file.isDirectory()) {
			throw new FileNotFoundException();
		}
		@SuppressWarnings("resource")
		BufferedReader br = new BufferedReader(new FileReader(file));
		String temp = null;
		StringBuffer sb = new StringBuffer();
		temp = br.readLine();
		while (temp != null) {
			sb.append(temp + " ");
			temp = br.readLine();
		}
		return sb.toString();
	}

	/**
	 * 写文件
	 * 
	 * @param fileName
	 *            文件的全名(包含文件所在的路径和文件名)
	 * @param content
	 *            要写入的内容
	 * @param encoding
	 *            文件的编码格式
	 * @throws IOException
	 */
	public boolean writeFile(String fileName, String content, String encoding) {
		File file = new File(fileName);
		if (!file.exists()) { //文件不存在
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
		}else{//文件存在
			file.delete();
		}

		FileOutputStream fileOutputStream;
		try {
			fileOutputStream = new FileOutputStream(file, true);
			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append(content);
			fileOutputStream.write(stringBuffer.toString().getBytes(encoding));

			fileOutputStream.close();
			return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		} 

	}

 
}
