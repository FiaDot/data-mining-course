library(XML)

filename <- "D:/DataMining/data-mining-course/httpd/httpd_log_simple.xml"

xmlFile <- xmlTreeParse(filename)
class(xmlFile)

xmlTop = xmlRoot(xmlFile)
# print(xmlTop)[1:2]


doc <- xmlParse(filename)
df_paths <- xmlToDataFrame( 
              getNodeSet(doc, "//path"), 
              colClasses=c("list"))
print(df_paths)



print(xmlTop[1])

xml_lapply <- xmlApply(xmlTop, function(x) xmlApply(x, xmlValue))
print(xml_lapply)

# xml_unlist <- unlist(xml_lapply$logentry$paths)
# print(xml_unlist)

print(xml_lapply[1]$logentry$paths)
class(xml_lapply[1]$logentry$paths)


xml_apply <- xmlSApply(xmlTop, function(x) xmlSApply(x, xmlValue))
print(xml_apply)


# df <- data.frame(t(xml_apply), row.names=NULL)
df2 <- data.frame(t(sapply(xml_apply, unlist)), row.names=NULL)

print(df)



