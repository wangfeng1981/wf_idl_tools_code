pro modis_aod2pm25
;通过modis 气溶胶光学厚度aod月平均或者年平均数据计算pm2.5 pm25

;y = ax+b 微克每立方米
a = 57.232
b = 1.4551

filters = [ '*.*' ]
files = DIALOG_PICKFILE( /MULTIPLE_FILES, /READ , TITLE='Input files' ,  FILTER = filters )
if( files[0] eq '' ) then return 

num = N_ELEMENTS(files) 

for ifile = 0 , num-1 do Begin
  outfilename = files[ifile]+'.pm25'
  ENVI_OPEN_FILE, files[ifile], r_fid=fid
  ENVI_FILE_QUERY, fid  , dims=dims
  dimsrow = dims
  numline = dims[4]
  OPENW, 1, outfilename
  
  for iline = 0 , numline do begin
    dimsrow[3] = iline
    dimsrow[4] = iline
    data = ENVI_GET_DATA(fid=fid , dims=dimsrow, pos=0)
    for is = 0 , dims[2] do begin
      if( data[is] GT 0.0 ) then begin
        data[is] = data[is]*a+b
      endif
    endfor

    WRITEU, 1, data
  endfor
  print , 'file:' , ifile , 'ok'
  close , 1
  
endfor

print , 'all finshed!' 

end