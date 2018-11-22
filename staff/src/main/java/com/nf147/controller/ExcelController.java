//package com.nf147.controller;
//
//import com.nf147.dao.PersonnelMapper;
//import com.nf147.entity.Personnel;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.xssf.usermodel.XSSFRow;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.ByteArrayOutputStream;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//
//@Controller
//@RequestMapping("/excel")
//public class ExcelController {
//    @Autowired
//    private PersonnelMapper personnelMapper;
//
//    @GetMapping("/export")
//    public ResponseEntity<byte[]> exportExcel() throws Exception {
//        List<Personnel> personnels = personnelMapper.selectAll();
//        FileOutputStream fout = null;
//
//        XSSFWorkbook workbook = new XSSFWorkbook();
//        XSSFSheet sheet = workbook.createSheet("导出的表");
//
//        XSSFRow rowTH = sheet.createRow(0);
//        rowTH.createCell(0).setCellValue("员工编号");
//        rowTH.createCell(1).setCellValue("姓名");
//        rowTH.createCell(2).setCellValue("性别");
//        rowTH.createCell(3).setCellValue("学历");
//        rowTH.createCell(4).setCellValue("月薪");
//
//        for (int i = 0; i < personnels.size(); i++) {
//            XSSFRow rows = sheet.createRow(i + 1);
//            Personnel personnel = personnels.get(i);
//            rows.createCell(0).setCellValue(personnel.getId());
//            rows.createCell(1).setCellValue(personnel.getName());
//            rows.createCell(2).setCellValue(personnel.getSex());
//            rows.createCell(3).setCellValue(personnel.getEducation());
//            rows.createCell(4).setCellValue(personnel.getWages());
//        }
//        ByteArrayOutputStream stream = new ByteArrayOutputStream();
//        workbook.write(stream);
//
//        byte[] contents = stream.toByteArray();
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setCacheControl("no-cache, no-store, must-revalidate");
//        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//        headers.setContentLength(contents.length);
//        headers.setContentDispositionFormData("attachment", "StaffTable" + new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + ".xlsx");
//        return ResponseEntity.ok().headers(headers).body(contents);
//    }
//
//    @PostMapping("/import")
//    public String importExcel(MultipartFile file) throws IOException {
//        Personnel  personnel = null;
//        Workbook workbook = new XSSFWorkbook(file.getInputStream());    //获取 Excel 表格
//        Sheet sheet = workbook.getSheetAt(0);   //获得第一个工作表对象
//        int rowNum = sheet.getLastRowNum(); //获取所以行
//        for (int i = 0; i <= rowNum; i++) {
//            Row row = sheet.getRow(i);  //获取第i行
//            double id = Double.parseDouble(row.getCell(0).toString().trim());
//            String name = row.getCell(1).toString().trim();
//            String sex = row.getCell(2).toString().trim();
//            String educationrow = row.getCell(3).toString().trim();
//            double wages = Double.parseDouble(row.getCell(4).toString().trim());
//            personnel = new Personnel();
//            personnel.setId((int) id);
//            personnel.setName(name);
//            personnel.setSex(sex);
//            personnel.setEducation(educationrow);
//            personnel.setWages(wages);
//            personnelMapper.insert(personnel);
//        }
//        return "redirect:/";
//    }
//}
