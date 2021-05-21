package com.hu.ssm.bean;

import java.util.HashMap;
import java.util.Map;

public class CommonResult {
  private int code;
  private String msg;
  private Map<String,Object> data = new HashMap<String,Object>();
  
  public CommonResult add(String key,Object value) {
    this.data.put(key, value);
    return this;
  }
  public static CommonResult success() {
    CommonResult rs = new CommonResult();
    rs.setCode(100);
    rs.setMsg("success");
    return rs;
  }
  
  public static CommonResult fail() {
    CommonResult rs = new CommonResult();
    rs.setCode(200);
    rs.setMsg("fail");
    return rs;
  }
  
  public int getCode() {
    return code;
  }
  public void setCode(int code) {
    this.code = code;
  }
  public String getMsg() {
    return msg;
  }
  public void setMsg(String msg) {
    this.msg = msg;
  }
  public Map<String, Object> getData() {
    return data;
  }
  public void setData(Map<String, Object> data) {
    this.data = data;
  }
  
}
