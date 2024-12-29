from openpyxl import Workbook
from openpyxl.drawing.image import Image

# # สร้างไฟล์ Excel ใหม่
workbook = Workbook()
sheet = workbook.active

# # ตั้งชื่อ Sheet
# sheet.title = "Images"

# # เพิ่มหัวตาราง
# sheet["A1"] = "ID"
# sheet["B1"] = "Name"
# sheet["C1"] = "Photo"

# # เพิ่มข้อมูลตัวอย่าง
# sheet["A2"] = 1
# sheet["B2"] = "John Doe"

# เพิ่มรูปภาพ
image_path1 = "example.png"  # ระบุ path ของไฟล์รูปภาพ
image_path2 = "example2.png"  # ระบุ path ของไฟล์รูปภาพ
img1 = Image(image_path1)
img2 = Image(image_path2)

# ระบุตำแหน่งเซลล์สำหรับใส่รูปภาพ
sheet.add_image(img1, "A1")
sheet.add_image(img2, "B2")

# # บันทึกไฟล์ Excel
# output_path = "output_with_image.xlsx"
# workbook.save(output_path)

# print(f"Saved Excel file with image at: {output_path}")
