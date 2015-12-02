; 
; IDL Widget Interface Procedures. This Code is automatically 
;     generated and should not be modified.

; 
; Generated on:	08/05/2015 13:48.36
; 
pro WID_BASE_0_event, Event

  wTarget = (widget_info(Event.id,/NAME) eq 'TREE' ?  $
      widget_info(Event.id, /tree_root) : event.id)


  wWidget =  Event.top

  case wTarget of

    Widget_Info(wWidget, FIND_BY_UNAME='WID_BUTTON_HDF'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        ON_OPEN_HDF, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='WID_BUTTON_OK'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        ON_OK, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='WID_BUTTON_TIF'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        ON_OPEN_OUTTIF, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='WID_BUTTON_TEXTFILENAME'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        onImportFromTxt, Event
    end
    else:
  endcase

end

pro WID_BASE_0, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_

  Resolve_Routine, 'modaothdf2tif_eventcb',/COMPILE_FULL_FILE  ; Load event callback routines
  
  WID_BASE_0 = Widget_Base( GROUP_LEADER=wGroup, UNAME='WID_BASE_0'  $
      ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=669 ,SCR_YSIZE=395  $
      ,TITLE='MODIS HDFתGeoTiff' ,SPACE=3 ,XPAD=3 ,YPAD=3  $
      ,TLB_FRAME_ATTR=1)

  
  WID_LIST_0 = Widget_List(WID_BASE_0, UNAME='WID_LIST_0' ,FRAME=1  $
      ,XOFFSET=3 ,YOFFSET=6 ,SCR_XSIZE=648 ,SCR_YSIZE=218 ,XSIZE=11  $
      ,YSIZE=2)

  
  WID_BUTTON_HDF = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_HDF'  $
      ,XOFFSET=6 ,YOFFSET=231 ,SCR_XSIZE=118 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='select hdf files')

  
  WID_BUTTON_OK = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_OK'  $
      ,XOFFSET=472 ,YOFFSET=331 ,SCR_XSIZE=184 ,SCR_YSIZE=34  $
      ,/ALIGN_CENTER ,VALUE='OK')

  
  WID_TEXT_TIF = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_TIF'  $
      ,XOFFSET=129 ,YOFFSET=301 ,SCR_XSIZE=352 ,SCR_YSIZE=22  $
      ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  WID_BUTTON_TIF = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_TIF'  $
      ,XOFFSET=13 ,YOFFSET=301 ,SCR_XSIZE=108 ,SCR_YSIZE=25  $
      ,/ALIGN_CENTER ,VALUE='output path')

  
  WID_DROPLIST_DS = Widget_Droplist(WID_BASE_0,  $
      UNAME='WID_DROPLIST_DS' ,XOFFSET=8 ,YOFFSET=271 ,SCR_XSIZE=647  $
      ,SCR_YSIZE=22 ,TITLE='select dataset')

  
  WID_BUTTON_TEXTFILENAME = Widget_Button(WID_BASE_0,  $
      UNAME='WID_BUTTON_TEXTFILENAME' ,XOFFSET=152 ,YOFFSET=231  $
      ,SCR_XSIZE=212 ,SCR_YSIZE=29 ,/ALIGN_CENTER  $
      ,VALUE='load hdf from text file' )
  
  WID_TEXT_SN = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_SN'  $
      ,XOFFSET=506 ,YOFFSET=237 ,SCR_XSIZE=144 ,SCR_YSIZE=19  $
      ,/EDITABLE ,VALUE=[ 'mod08' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_0 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_0'  $
      ,XOFFSET=429 ,YOFFSET=239 ,/ALIGN_LEFT ,VALUE='Grid Name:')

  Widget_Control, /REALIZE, WID_BASE_0

  XManager, 'WID_BASE_0', WID_BASE_0, /NO_BLOCK  

end
; 
; Empty stub procedure used for autoloading.
; 
pro modaothdf2tif, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
  WID_BASE_0, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
end
