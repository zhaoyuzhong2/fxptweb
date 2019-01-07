package com.fxptw.util;

/**
 * Created by Administrator on 2019/1/6/006.
 */
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Zxing {
    @Autowired
    ParamSettings paramSettings;
    public void createImg(String path,String id,String result) {
        int width=300;
        int height=300;
        String format="png";
        //String url="www.baidu.com";
        String url = paramSettings.getUrl()+"/user/request?id="+id+"&result="+result;
        HashMap map=new HashMap();
        map.put(EncodeHintType.CHARACTER_SET, "utf-8");
        map.put(EncodeHintType.ERROR_CORRECTION,ErrorCorrectionLevel.M);
        map.put(EncodeHintType.MARGIN, 0);
        try {
            BitMatrix bm = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);
            Path file=new File(path).toPath();
            MatrixToImageWriter.writeToPath(bm, format, file);
        } catch (WriterException e) {
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
