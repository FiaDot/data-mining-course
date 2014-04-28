# How to access XML? see also : http://sweeper.egloos.com/3045370
from xml.etree.ElementTree import parse
tree = parse("httpd_log_simple.xml")
log_root = tree.getroot()

for parent in tree.getiterator("logentry"):
    for child in parent:
        print(child)    
        # print(child.text)
        # print(child.find("path").text)
        child.attrib["paths"]

# 개별 attribute에 접근 하는 방법은??
