package com.palza.ex.dto;

import java.sql.Timestamp;

public class productDto {

   private int rnum;
   private int pd_id;
   private String pd_name;
   private String pd_desc;
   private String rg_id;
   private Timestamp rg_date;
   private int hits;
   private int price;
   private char categories;
   private char complete_chk;
   private String img;
   private String id;
   
   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

   private productDto() {
   }

   @Override
   public String toString() {
      return "productDto [rnum=" + rnum + ", pd_id=" + pd_id + ", pd_name=" + pd_name + ", pd_desc=" + pd_desc
            + ", rg_id=" + rg_id + ", rg_date=" + rg_date + ", hits=" + hits + ", price=" + price + ", categories="
            + categories + ", complete_chk=" + complete_chk + ", img=" + img + "]";
   }

   public productDto(int rnum, int pd_id, String pd_name, String pd_desc, String rg_id, Timestamp rg_date, int hits,
         char categories, char complete_chk, int price, String id) {
      super();
      this.rnum = rnum;
      this.pd_id = pd_id;
      this.pd_name = pd_name;
      this.pd_desc = pd_desc;
      this.rg_id = rg_id;
      this.rg_date = rg_date;
      this.hits = hits;
      this.price = price;
      this.categories = categories;
      this.id = id;
   }

   public int getRnum() {
      return rnum;
   }

   public void setRnum(int rnum) {
      this.rnum = rnum;
   }

   public int getPd_id() {
      return pd_id;
   }

   public void setPd_id(int pd_id) {
      this.pd_id = pd_id;
   }

   public String getPd_name() {
      return pd_name;
   }

   public void setPd_name(String pd_name) {
      this.pd_name = pd_name;
   }

   public String getPd_desc() {
      return pd_desc;
   }

   public void setPd_desc(String pd_desc) {
      this.pd_desc = pd_desc;
   }

   public String getRg_id() {
      return rg_id;
   }

   public void setRg_id(String rg_id) {
      this.rg_id = rg_id;
   }

   public Timestamp getRg_date() {
      return rg_date;
   }

   public void setRg_date(Timestamp rg_date) {
      this.rg_date = rg_date;
   }

   public int getHits() {
      return hits;
   }

   public void setHits(int hits) {
      this.hits = hits;
   }

   public char getCategories() {
      return categories;
   }

   public void setCategories(char categories) {
      this.categories = categories;
   }

   public char getComplete_chk() {
      return complete_chk;
   }

   public void setComplete_chk(char complete_chk) {
      this.complete_chk = complete_chk;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }
   
   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }
   
   

}