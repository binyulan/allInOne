package com.auuid.poi;

import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class POITest {
	
	private static final Logger LOG = LoggerFactory.getLogger(POITest.class);
	
	@Test
	public void testCreateExcel() {

		// 生成Workbook
		XSSFWorkbook wb = new XSSFWorkbook();

		// 添加Worksheet（不添加sheet时生成的xls文件打开时会报错）
		Sheet sheet1 = wb.createSheet();
		Row row1 = sheet1.createRow(1);
		Cell cell1_1 = row1.createCell(1);
		cell1_1.setCellValue(123);

		// 保存为Excel文件
		FileOutputStream out = null;

		try {
			out = new FileOutputStream("./aa.xlsx");
			wb.write(new FileOutputStream("./aa.xlsx"));
			LOG.info("file was created successfully");
		} catch (IOException e) {
			LOG.error(e.getMessage());
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				LOG.error(e.getMessage());
			}
			try {
				wb.close();
			} catch (IOException e) {
				LOG.error(e.getMessage());
			}
		}
	}
}
