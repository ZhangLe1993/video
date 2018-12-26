package com.video.exception;

public class SessionUserNotFoundException extends RuntimeException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8645239924026691258L;

	public SessionUserNotFoundException() {
	}

	public SessionUserNotFoundException(String info) {
		super(info);
	}
}
