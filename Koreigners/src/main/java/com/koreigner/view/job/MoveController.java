package com.koreigner.view.job;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoveController {

	@RequestMapping(value="about_go.do")
	public String about_go() {
		
		return "bootstrap/about.page";
	}
	
	@RequestMapping(value="cart_go.do")
	public String cart_go() {
		
		return "bootstrap/cart.page";
	}
	
	@RequestMapping(value="checkout_go.do")
	public String checkout_go() {
		
		return "bootstrap/checkout.page";
	}
	
	@RequestMapping(value="contact-us_go.do")
	public String contactus_go() {
		
		return "bootstrap/contact-us.page";
	}
	
	@RequestMapping(value="gallery_go.do")
	public String gallery_go() {
		
		return "bootstrap/gallery.page";
	}
	
	@RequestMapping(value="index_go.do")
	public String index_go() {
		
		return "bootstrap/index.page";
	}
	
	@RequestMapping(value="my-account_go.do")
	public String my_account_go() {
		
		return "bootstrap/my-account.page";
	}
	
	@RequestMapping(value="shop-detail_go.do")
	public String shop_detail_go() {
		
		return "bootstrap/shop-detail.page";
	}
	
	@RequestMapping(value="shop_go.do")
	public String shop_go() {
		
		return "bootstrap/shop.page";
	}
	
	@RequestMapping(value="wishlist_go.do")
	public String wishlist_go() {
		
		return "bootstrap/wishlist.page";
	}
	
}
