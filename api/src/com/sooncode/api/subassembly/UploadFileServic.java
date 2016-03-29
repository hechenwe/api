package com.sooncode.api.subassembly;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

/**
 * 上传文件服务组件
 * @author hechen
 *
 */
public class UploadFileServic {
	
	
    /** upload 文件夹  */
	private static final String UPLOAD = "upload";
	
	
	/** image 文件夹  */
	private static final String IMAGE = "image";
	
	/**
	 * 需要在web.xml中配置 org.springframework.web.util.WebAppRootListener 
	 * 
	 */
	private static final String WEB_ROOT = System.getProperty("api.root");
	
	
	/**
	 * 获取随机文件名
	 * @param oldFileName 原始问件名
	 * @return 随机文件名
	 */
	public static  String getUuidFileName (String oldFileName){
		
		String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase(); //UUID 字符串　
        String fileNameSuffix = oldFileName.split("\\.")[1]; //文件后缀
        String newFileName = uuid+ "." + fileNameSuffix ;   //新文件名
		return newFileName ;
	}
	
	
	/**
	 * 构造一个以当前日期（年月）命名的文件夹名称
	 * @return 当前日期（年月）命名的文件夹名称
	 */
	public static String buildThisDateFolderName (){
		Calendar calendar  = Calendar.getInstance(); //日历
	    String year = String.valueOf(calendar.get(Calendar.YEAR)); //年
	    String month = String.valueOf(calendar.get(Calendar.MONTH)+1);//月
	    return year + month ;
	}
	
	
	
	
	/**
	 * 构造文件路径
	 * @param webRoot
	 * @return
	 */
	public static String buildFilePath (){
		    
		    String dateFolderName = buildThisDateFolderName ();
		    char separatorChar= File.separatorChar;//分隔符
	        String path = WEB_ROOT + UPLOAD + separatorChar + IMAGE +separatorChar + dateFolderName;  //文件存放的路径
	        return path ;
	}
	
	
	/**
	 * 获取相对路径
	 * @return
	 */
	public static String getRelativePath (){
		String dateFolderName = buildThisDateFolderName ();
	    char separatorChar= File.separatorChar;//分隔符
        String path =  UPLOAD + separatorChar + IMAGE +separatorChar + dateFolderName;  //文件存放的路径
        return path ;
	}
	
	/**
	 * 保存文件
	 * @param file 文件对象
	 * @return 文件的相对路径
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String saveFile(MultipartFile file)  {
		
	    String path = buildFilePath (); //文件存放的路径（绝对）
	    String fileName = getUuidFileName(file.getOriginalFilename()); //文件重命名
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
        	
            targetFile.mkdirs();//创建目录（文件夹）
        }  
      
        //保存  
        String massage = "ERROR";
        try {
			file.transferTo(targetFile);
			massage = getRelativePath() + File.separatorChar + fileName; // 文件存放的相对路径
		} catch (IllegalStateException e) {
			 
			e.printStackTrace();
		} catch (IOException e) {
			 
			e.printStackTrace();
		}  
         
        return massage ;
}
	
}
