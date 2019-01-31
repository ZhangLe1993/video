package com.video.utils;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.LinkedHashMap;
import java.util.Map;

public class JsonUtils {

	private static JsonFactory jsonFactory = new JsonFactory();
	private static ObjectMapper objectMapper = new ObjectMapper();
	static {
		objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
		objectMapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
		objectMapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
	}

	/**
	 * object 转 json 串,异常时返回空串
	 * 
	 * @param obj
	 * @return
	 */
	public static String obj2Json(Object obj) {
		String json = null;
		try {
			json = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * json串 转 object ,异常时返回 null
	 * 
	 * @param json
	 * @param clazz
	 * @return
	 */
	public static <T> T json2Obj(String json, Class<T> clazz) {
		try {
			return objectMapper.readValue(json, clazz);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * json串 转 Map, 异常时返回空Map
	 * 
	 * @param json
	 * @return
	 */
	public static Map<String, Object> json2Map(String json) {
		try {
			TypeReference<LinkedHashMap<String, Object>> typeRef = new TypeReference<LinkedHashMap<String, Object>>() {
			};
			return objectMapper.readValue(json, typeRef);
		} catch (Exception e) {
		}
		return new LinkedHashMap<String, Object>();
	}
	
}
