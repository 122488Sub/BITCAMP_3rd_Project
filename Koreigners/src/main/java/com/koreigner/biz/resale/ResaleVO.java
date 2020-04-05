package com.koreigner.biz.resale;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author bitcamp
 *
 */
/**
 * @author bitcamp
 *
 */
public class ResaleVO {
		int rs_idx, board_idx, b_status, hit, price;
		String mem_id, mem_pw, mem_name, subject, address, work_loc_si, fileStr,
		       work_loc_do, rs_cate_prnt, category_child, content, file_ori_name, ip,condition, hash_tag;
		List<MultipartFile> filename;
		String regdate;
		private String searchKeyword;
		private int begin;
		private int end;
		
		public int getBegin() {
			return begin;
		}


		public void setBegin(int begin) {
			this.begin = begin;
		}


		public int getEnd() {
			return end;
		}


		public void setEnd(int end) {
			this.end = end;
		}


		public String getSearchKeyword() {
			return searchKeyword;
		}


		public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
		}


		public ResaleVO() {}


		public int getPrice() {
			return price;
		}


		public void setPrice(int price) {
			this.price = price;
		}


		public String getFileStr() {
			return fileStr;
		}


		public void setFileStr(String fileStr) {
			this.fileStr = fileStr;
		}


		public int getRs_idx() {
			return rs_idx;
		}


		public void setRs_idx(int rs_idx) {
			this.rs_idx = rs_idx;
		}


		public int getBoard_idx() {
			return board_idx;
		}


		public void setBoard_idx(int board_idx) {
			this.board_idx = board_idx;
		}


		public int getB_status() {
			return b_status;
		}


		public void setB_status(int b_status) {
			this.b_status = b_status;
		}


		public int getHit() {
			return hit;
		}


		public void setHit(int hit) {
			this.hit = hit;
		}


		public String getMem_id() {
			return mem_id;
		}


		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}


		public String getMem_pw() {
			return mem_pw;
		}


		public void setMem_pw(String mem_pw) {
			this.mem_pw = mem_pw;
		}


		public String getMem_name() {
			return mem_name;
		}


		public void setMem_name(String mem_name) {
			this.mem_name = mem_name;
		}


		public String getSubject() {
			return subject;
		}


		public void setSubject(String subject) {
			this.subject = subject;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public String getWork_loc_si() {
			return work_loc_si;
		}


		public void setWork_loc_si(String work_loc_si) {
			this.work_loc_si = work_loc_si;
		}


		public String getWork_loc_do() {
			return work_loc_do;
		}


		public void setWork_loc_do(String work_loc_do) {
			this.work_loc_do = work_loc_do;
		}


		public String getRs_cate_prnt() {
			return rs_cate_prnt;
		}


		public void setRs_cate_prnt(String rs_cate_prnt) {
			this.rs_cate_prnt = rs_cate_prnt;
		}


		public String getCategory_child() {
			return category_child;
		}


		public void setCategory_child(String category_child) {
			this.category_child = category_child;
		}


		public String getContent() {
			return content;
		}


		public void setContent(String content) {
			this.content = content;
		}



		public List<MultipartFile> getFilename() {
			return filename;
		}


		public void setFilename(List<MultipartFile> filename) {
			this.filename = filename;
		}


		public String getFile_ori_name() {
			return file_ori_name;
		}


		public void setFile_ori_name(String file_ori_name) {
			this.file_ori_name = file_ori_name;
		}


		public String getIp() {
			return ip;
		}


		public void setIp(String ip) {
			this.ip = ip;
		}


		public String getCondition() {
			return condition;
		}


		public void setCondition(String condition) {
			this.condition = condition;
		}


		public String getHash_tag() {
			return hash_tag;
		}


		public void setHash_tag(String hash_tag) {
			this.hash_tag = hash_tag;
		}


		public String getRegdate() {
			return regdate;
		}


		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}


		@Override
		public String toString() {
			return "ResaleVO [rs_idx=" + rs_idx + ", board_idx=" + board_idx + ", b_status=" + b_status + ", hit=" + hit
					+ ", price=" + price + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
					+ ", subject=" + subject + ", address=" + address + ", work_loc_si=" + work_loc_si + ", fileStr="
					+ fileStr + ", work_loc_do=" + work_loc_do + ", rs_cate_prnt=" + rs_cate_prnt + ", category_child="
					+ category_child + ", content=" + content + ", file_ori_name=" + file_ori_name + ", ip=" + ip
					+ ", condition=" + condition + ", hash_tag=" + hash_tag + ", filename=" + filename + ", regdate="
					+ regdate + ", searchKeyword=" + searchKeyword + ", begin=" + begin + ", end=" + end + "]";
		}




		
		
		
		
}
