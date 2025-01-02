from openpyxl import Workbook
from openpyxl.drawing.image import Image
import sys

def main():
    # รับค่า argument จาก Robot Framework
    workbook = Workbook()
    sheet = workbook.active
    a = sys.argv[1]
    b = sys.argv[2]
    image_path1 = a      # ระบุ path ของไฟล์รูปภาพ
    image_path2 = b  # ระบุ path ของไฟล์รูปภาพ
    img1 = Image(image_path1)
    img2 = Image(image_path2)
    sheet.add_image(img1, "A3")
    sheet.add_image(img2, "B3")
    output_path = "/Users/pichaya/Documents/GitHub/logic_sudoku/resource/excel/test_excel.xlsx"
    workbook.save(output_path)

if __name__ == "__main__":
    main()




