package com.video.base.pojo;

import java.io.Serializable;

public class ResultDO<T> extends BaseVo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8768942173813741640L;

	// 业务操作是否成功
	private boolean isOK = true;
	// 返回值，可以是任何类型
	private T obj;
	// 响应错误码
	private String errorMsg;
	// 响应码
	private String errorCode;

	public ResultDO() {
	}

	public ResultDO(boolean _isOK) {
		this.isOK = _isOK;
	}

	public ResultDO(T result) {
		this.isOK = true;
		this.obj = result;
	}

	public ResultDO(String errorCode, String errorMsg) {
		this.isOK = false;
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}

	public ResultDO(String errorCode, String errorMsg, T result) {
		this.isOK = false;
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
		this.obj = result;
	}
	
	public ResultDO(boolean _isOK,String errorCode, String errorMsg, T result) {
		this.isOK = _isOK;
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
		this.obj = result;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public boolean isOK() {
		return isOK;
	}

	public ResultDO<T> setOK(boolean isOK) {
		this.isOK = isOK;
		return this;
	}

	public T getObj() {
		return obj;
	}

	public ResultDO<T> setObj(T obj) {
		this.obj = obj;
		return this;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public ResultDO<T> setErrorMsg(String errorMsg) {
		this.isOK = false;
		this.errorMsg = errorMsg;
		return this;
	}

}
