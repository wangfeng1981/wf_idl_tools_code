pro compute_average

filters = [ '*.tif' ]
files = DIALOG_PICKFILE( /MULTIPLE_FILES, /READ , TITLE='Input files' ,  FILTER = filters )
if( files[0] eq '' ) then return 

num = N_ELEMENTS(files) 
fidsArray = intarr(num)
FOR ifile = 0,num-1  DO begin
  ENVI_OPEN_FILE, files[ifile], r_fid=fid
  fidsArray[ifile] = fid 
ENDFOR

OPENW, 1, files[0]+'.out' 

ENVI_FILE_QUERY, fidsArray[0] , dims=dims
dimsrow = dims
numline = dims[4]

for iline = 0 , numline do begin
    dimsrow[3] = iline
    dimsrow[4] = iline
    data = fltarr(dims[2]+1)
    datanum = fltarr(dims[2]+1)
    for ifile = 0 , num-1 do begin
        data1 = ENVI_GET_DATA(fid= fidsArray[ifile] , dims=dimsrow, pos=0)
        for is = 0 , dims[2] do begin
          if( finite(data1[is]) EQ 1 ) then begin
            data[is] = data[is] + data1[is]
            datanum[is] = datanum[is]+1
          endif
        endfor
    endfor
    
    for is = 0 , dims[2] do begin
      if( datanum[is] GT 0 ) then begin
        data[is] = data[is] / datanum[is]
      endif ELSE BEGIN
        data[is] = -1.0
      endelse
    endfor
    
    WRITEU, 1, data
    print ,'line:', iline , numline
endfor

close , 1

print , 'all finshed!' 

end