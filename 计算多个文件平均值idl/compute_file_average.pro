pro compute_file_average
;逐个文件计算该文件有效像素的总体平均值 全部有效像素值的和 除以 有效像素个数

filters = [ '*.tif' ]
files = DIALOG_PICKFILE( /MULTIPLE_FILES, /READ , TITLE='Input files' ,  FILTER = filters )
if( files[0] eq '' ) then return 

num = N_ELEMENTS(files) 
FOR ifile = 0,num-1  DO begin
  ENVI_OPEN_FILE, files[ifile], r_fid=fid
  ENVI_FILE_QUERY, fid , dims=dims
  dimsrow = dims
  numline = dims[4]
  aver = 0.0
  cnt = 0l 
  for iline = 0 , numline do begin
    dimsrow[3] = iline
    dimsrow[4] = iline
    data1 = ENVI_GET_DATA(fid= fid , dims=dimsrow, pos=0)
    for is = 0 , dims[2] do begin
      if( data1[is] GT 0 ) then begin
        aver = aver + data1[is]
        cnt = cnt + 1
      endif
    endfor
  endfor
  if cnt eq 0 then cnt=1
  aver2 = aver / cnt
  print , files[ifile] , aver2
ENDFOR


print , 'all finshed!' 

end