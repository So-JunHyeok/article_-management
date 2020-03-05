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
                    // �ҷ� Ȯ���ڰ� �����ҋ� IOExepction �߻�
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
                return true; // �ҷ� Ȯ���ڰ� �����Ҷ�..
            }
        }
        return false;
    }

}
