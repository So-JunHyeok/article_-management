package com.real_estate.agent.util;


import java.io.File;

import java.io.IOException;

public class FileExtFilter {
	
	public static void badFileExtIsReturnException(File file) {
        String fileName = file.getName();
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1,
                fileName.length());
        final String[] BAD_EXTENSION = { "jsp", "php", "asp", "html", "perl" ,""};
 
        try {
            int len = BAD_EXTENSION.length;
            for (int i = 0; i < len; i++) {
                if (ext.equalsIgnoreCase(BAD_EXTENSION[i])) {
                    // 불량 확장자가 존재할떄 IOExepction 발생
                    throw new IOException("BAD EXTENSION FILE UPLOAD");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
 
    public static boolean badFileExtIsReturnBoolean(File file) {
        String fileName = file.getName();
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1,
                fileName.length());
        final String[] BAD_EXTENSION = { "jsp", "php", "asp", "html", "perl" ,""};
 
        int len = BAD_EXTENSION.length;
        for (int i = 0; i < len; i++) {
            if (ext.equalsIgnoreCase(BAD_EXTENSION[i])) {
                return true; // 불량 확장자가 존재할때..
            }
        }
        return false;
    }

}
