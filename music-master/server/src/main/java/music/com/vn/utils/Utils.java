package music.com.vn.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Utils {


  @SuppressWarnings("unused")
  public
  static void saveUploadedFiles(MultipartFile file, String fullPath) throws IOException {
    if (file.isEmpty()) {
      return;
    }

    byte[] bytes = file.getBytes();
    File dir = new File(fullPath);
    if (!dir.exists()) {
      dir.mkdirs();
    }
    Path path = Paths.get(fullPath + file.getOriginalFilename());
    Files.write(path, bytes);

  }

  public static boolean userHasAuthority(String roleCode) {
    List<GrantedAuthority> list = (List<GrantedAuthority>) (SecurityContextHolder.getContext().getAuthentication().getAuthorities());
    List<GrantedAuthority> authories = list;
    for (GrantedAuthority authority : authories) {
      if (authority.getAuthority().equals(roleCode)) {
        return true;
      }
    }
    return false;
  }

  public static List<String> getAuthorities() {
    List<String> results = new ArrayList<String>();
    List<GrantedAuthority> authorities = (List<GrantedAuthority>) (SecurityContextHolder.getContext().getAuthentication().getAuthorities());
    for (GrantedAuthority authority : authorities) {
      results.add(authority.getAuthority());
    }
    return results;
  }

  @SuppressWarnings("resource")
  public static String uploadBase64(String namefile, String pathSaveImage, String StrBase64) {
    try {
      //This will decode the String which is encoded by using Base64 class
      byte[] imageByte = Base64.decodeBase64(StrBase64);
      String directory = pathSaveImage + "/" + namefile + ".jpg";
      new FileOutputStream(directory).write(imageByte);
      return "success ";
    } catch (Exception e) {
      return "error = " + e;
    }
  }

  private static String baseDir = System.getProperty("catalina.home") + "/music/images/";

  public static String writeOrUpdate(String path, String base64) {
    String imageName = RandomStringUtils.randomAlphanumeric(17);
    checkAndCreateFolder(baseDir, path);
    FileOutputStream outputStream = null;
    try {
      String position = baseDir + File.separator + path + File.separator + imageName + ".jpg";
      File file = new File(position);
      if (file.exists()) {
        file.delete();
      }
      outputStream = new FileOutputStream(position);
      byte[] decodedString = Base64.decodeBase64(base64.substring(23).getBytes());
      outputStream.write(decodedString);
      return imageName+".jpg";
    } catch (IOException e) {

    } finally {
      try {
        if (outputStream != null)
          outputStream.close();
      } catch (IOException e) {

      }
    }
    return imageName+".jpg";
  }

  private static void checkAndCreateFolder(String location, String path) {
    File fileLocation = new File(location);
    if (!fileLocation.exists()) {
      fileLocation.mkdir();
    }
    File file = new File(fileLocation + File.separator + path);
    if (!file.exists()) {
      file.mkdirs();
    }
  }


}
