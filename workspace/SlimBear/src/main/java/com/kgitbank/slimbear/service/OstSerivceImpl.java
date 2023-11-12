package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.vo.MemberCartVO;

@Service
public class OstSerivceImpl {

    private List<MemberCartVO> cartList = new ArrayList<>();

    // 생성자에서 초기 데이터베이스 조회
    public OstSerivceImpl() {
        initializeCart();
    }

    private void initializeCart() {
        // 데이터베이스에서 초기 장바구니 정보를 가져옴
        // 예시로 가상의 데이터를 추가
        for (int i = 0; i < 4; ++i) {
            MemberCartVO membercart = new MemberCartVO();
            membercart.setUid(i);
            membercart.setDesc("유해커의 후드티");
            membercart.setInfoo("입는순간 유해커가 되는 후드티");
            membercart.setQuantity(i);
            membercart.setAddprice(100);
            membercart.setPrice(45000);
            membercart.setBaedalprice(2500);
            membercart.setProductId(i);
            membercart.setTotalprice(membercart.getQuantity() * membercart.getPrice());
            membercart.setTotalprice(membercart.getQuantity() * membercart.getAddprice());

            cartList.add(membercart);
        }
    }
    
    public List<MemberCartVO> getCart() {
        return cartList;
    }
    public List<MemberCartVO> deleteSelectedItems(List<Long> ctg_uid) {
        System.out.println("Received ctg_uid: " + ctg_uid);

        List<MemberCartVO> updatedCart = new ArrayList<>();

        // ctg_uid에 해당하는 상품들을 삭제하고, 업데이트된 장바구니 정보를 반환
        for (MemberCartVO cartItem : cartList) {
            if (!ctg_uid.contains(cartItem.getUid())) {
                updatedCart.add(cartItem);
            }
        }
        cartList = updatedCart;

        return updatedCart;
    }

 // 해당 제품의 수량을 업데이트하는 메서드 추가
    public void updateQuantity(long productId, int newQuantity) {
        for (MemberCartVO cartItem : cartList) {
            if (cartItem.getUid() == productId) {
                // 수량을 업데이트하고 totalprice도 다시 계산
                cartItem.setQuantity(newQuantity);
                cartItem.setTotalprice(newQuantity * cartItem.getPrice());
                break;  // 해당 제품을 찾았으므로 반복 중단
            }
        }
        //ostRepository.updateQuantity(productId, newQuantity); 데이터베이스 업데이트 로직을 추가할 수 있음
    }
    
}

