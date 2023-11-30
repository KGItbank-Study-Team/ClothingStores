package com.kgitbank.slimbear.admin.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.slimbear.admin.command.ProductUpdateCMD;
import com.kgitbank.slimbear.admin.dao.AdminDAO;
import com.kgitbank.slimbear.admin.dto.AdminDTO;
import com.kgitbank.slimbear.admin.dto.OrderListDTO;
import com.kgitbank.slimbear.admin.dto.ProductTotalListDTO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dao.ProductDetailDAO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;

@Service
public class AdminServiceImpl {

	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductDetailDAO productDtailDAO;
	
	public AdminDTO getAdminByID(String id) {
		return adminDAO.getAdminById(id);
	}

	public List<ProductTotalListDTO> getProductTotalListDTO() {
		return adminDAO.getProductTotalList();
	}

	public void addProduct(ProductUpdateCMD product, String uploadPath) {

		ProductDTO saveInfo = new ProductDTO();

		saveInfo.setName(product.getName());
		saveInfo.setDesc(product.getDescription());
		saveInfo.setCtg_uid(product.getCategory());
		saveInfo.setPrice(product.getPrice());
		saveInfo.setReg_date(new Date(System.currentTimeMillis()));
		saveInfo.setMaker("슬림베어");
		
		// 대표이미지 파일
		if(product.getMain_image().getSize() != 0)
		{
			String mainImageName = SaveMainImageFile(product.getMain_image(), uploadPath);
			if (mainImageName == null) {
				// 파일 저장 실패 
				return;
			}
			saveInfo.setMain_image(mainImageName);
		}
		else {
			saveInfo.setMain_image("");
		}

		long uid = productDAO.insertProductReturnUID(saveInfo);
		
		for(int i=0; i<product.getColors().size(); ++i) {
			ProductDetailDTO productDetail = new ProductDetailDTO();
			productDetail.setProd_uid(uid);
			productDetail.setColor(product.getColors().get(i));
			productDetail.setSize(product.getSizes().get(i));
			productDetail.setCnt(0);
			productDtailDAO.addProductDetail(productDetail);
		}
		
	}
	
	public void updateProduct(ProductUpdateCMD product, String uploadPath) {
		ProductDTO saveInfo = new ProductDTO();

		saveInfo.setUid(product.getUid());
		saveInfo.setName(product.getName());
		saveInfo.setDesc(product.getDescription());
		saveInfo.setCtg_uid(product.getCategory());
		saveInfo.setPrice(product.getPrice());
		saveInfo.setReg_date(new Date(System.currentTimeMillis()));
		saveInfo.setMaker("슬림베어");
	
		if(product.getMain_image().getSize() != 0)
		{
			String mainImageName = SaveMainImageFile(product.getMain_image(), uploadPath);
			if (mainImageName == null) {
				// 파일 저장 실패 
				return;
			}
			saveInfo.setMain_image(mainImageName);
		}
		else {
			saveInfo.setMain_image(null);
		}
		
		productDAO.updateProduct(saveInfo);
	}
	
	public void addProductDetail(ProductDetailDTO detail) {
		productDtailDAO.addProductDetail(detail);
	}
	
	public void updateProductDetail(ProductDetailDTO detail) {

		productDtailDAO.updateProductDetail(detail);
	}
	
	public void deleteProductDetail(ProductDetailDTO detail) {
		productDtailDAO.deleteProductDetail(detail);
	}
	

	public List<OrderListDTO> getOrderInfos() {
		
		return adminDAO.getOrderList();
	}
	
	public OrderListDTO getOrderDetailInfos(long order_uid) {
		OrderListDTO order = new OrderListDTO();
		
		order.setProductDetails(adminDAO.getOrderProductDetilsListByOrderUID(order_uid));;

		return order;
	}

	private String SaveMainImageFile(MultipartFile file, String uploadPath) {
		
		String fileRealName = file.getOriginalFilename();

		// 파일 이름
	    String fileName = fileRealName.substring(fileRealName.lastIndexOf("//")+1);
	    
		// 확장자(확장자 검사할때 사용)
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
	
		// 날짜 폴더 생성 및 이름 가져오기
		String folderPath = makeDateFolder(uploadPath);
		
		// UUID 사용해서 중복되는 않는 이름 생성
        String uuid = UUID.randomUUID().toString();
        
        //저장할 파일 이름 중간에 "_"를 이용하여 구분
        String fileNewRealName = folderPath +File.separator + uuid + "_" + fileName;
       
        
        // 저장실행 및 예외처리
        Path savePath = Paths.get(uploadPath + File.separator + fileNewRealName); 
        try{
        	file.transferTo(savePath);
          
        } catch (IOException e) {
             e.printStackTrace();
             return null;
        }

		return fileNewRealName;
	}

	private String makeDateFolder(String uploadPath) {

		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
		// LocalDate를 문자열로 포멧
		String folderPath = str.replace("/", File.separator);
		// 만약 Data 밑에 exam.jpg라는 파일을 원한다고 할때,
		// 윈도우는 "Data\\"eaxm.jpg", 리눅스는 "Data/exam.jpg"라고 씁니다.
		// 그러나 자바에서는 "Data" +File.separator + "exam.jpg" 라고 쓰면 됩니다.

		File uploadPathFoler = new File(uploadPath, folderPath);
		// File newFile= new File(dir,"파일명");
		// ->부모 디렉토리를 파라미터로 인스턴스 생성

		if (uploadPathFoler.exists() == false) {
			uploadPathFoler.mkdirs();
			// 만약 uploadPathFolder가 존재하지않는다면 makeDirectory하라는 의미입니다.
			// mkdir(): 디렉토리에 상위 디렉토리가 존재하지 않을경우에는 생성이 불가능한 함수
			// mkdirs(): 디렉토리의 상위 디렉토리가 존재하지 않을 경우에는 상위 디렉토리까지 모두 생성하는 함수
		}
		
		return folderPath;
	}



}
