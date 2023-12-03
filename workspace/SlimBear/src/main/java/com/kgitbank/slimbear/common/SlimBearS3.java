package com.kgitbank.slimbear.common;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;

public class SlimBearS3 {

	final private AmazonS3 s3Client;

	private String bucketName = "버킷명";

	public SlimBearS3(String bucket, String accessKey, String secretKey) {
		bucketName = bucket;

		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);

		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(Regions.AP_NORTHEAST_2).build();
	}

	public String saveImage(MultipartFile file) {

		String fileRealName = file.getOriginalFilename();

		// 파일 이름
	    String fileName = fileRealName.substring(fileRealName.lastIndexOf("//")+1);
	    
		// 확장자(확장자 검사할때 사용)
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
	
		// 날짜 폴더 생성 및 이름 가져오기
		String folderPath = getFolder();
		
		// UUID 사용해서 중복되는 않는 이름 생성
        String uuid = UUID.randomUUID().toString();
        
        //저장할 파일 이름 중간에 "_"를 이용하여 구분
        String s3Path = folderPath + '/' + uuid + "_" + fileName;

		try {
			uploadFile(file, "images/"+s3Path);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return s3Path;
	}

	// upload original image file
	private void uploadFile(MultipartFile image, String s3Path) {
		try {
			// set ObjectMatadata
			byte[] bytes = IOUtils.toByteArray(image.getInputStream());

			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentLength(bytes.length);
			objectMetadata.setContentType(image.getContentType());

			// save in S3
			ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
			this.s3Client.putObject(this.bucketName, s3Path.replace(File.separatorChar, '/'), byteArrayInputStream,
					objectMetadata);

			byteArrayInputStream.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	private String getFolder() {
		return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
	}

}
