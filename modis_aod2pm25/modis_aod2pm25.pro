pro modis_aod2pm25
; convert tif modis aod month L3 data to tif pm25 data
;jfwf@yeah.net 20160516

a = 79.33
b = 16.33

filters = [ '*.tif' ]
files = DIALOG_PICKFILE( /MULTIPLE_FILES, /READ , TITLE='Input files' ,  FILTER = filters )
if( files[0] eq '' ) then return

num = N_ELEMENTS(files)

for ifile = 0 , num-1 do Begin
  outfilename = files[ifile]+'.pm25'
  outfilename2=  outfilename+"tif.tif"
  ENVI_OPEN_FILE, files[ifile], r_fid=fid
  ENVI_FILE_QUERY, fid  , dims=dims , ns=ns , nl=nl
  t_fid = [fid]
  pos  = [0]
  expstr = 'b1*'+string(a)+'+'+string(b)
  envi_doit, 'math_doit', $
    fid=t_fid, pos=pos, dims=dims, $
    exp=expstr, out_name=outfilename, $
    r_fid=r_fid

  ENVI_OUTPUT_TO_EXTERNAL_FORMAT , DIMS=dims,fid=r_fid ,$
    OUT_NAME= outfilename2,pos=[0],/TIFF
  envi_file_mng, id=fid, /remove ;, /delete
  envi_file_mng, id=r_fid, /remove, /delete
endfor

print , 'all finshed!'

end