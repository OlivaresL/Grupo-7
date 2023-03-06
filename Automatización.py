import win32com.client as win32
import os

def clear_pts(ws):
    for pt in ws.PivotTables():
        pt.TableRange2.Clear()
def insert_pt_field_set1(pt):
    field_filters = {}
    field_filters['comuna'] = pt.PivotFields("COMUNA")
    field_filters['comuna'].Orientation = 3

    comunas_seleccionadas = ["CALLE LARGA", "CATEMU", "RINCONADA", "LOS ANDES", "LLAY LLAY", "SAN FELIPE", "PUTAENDO", "SANTA MARÍA", "PANQUEHUE", "SAN ESTEBAN"]

    for item in field_filters['comuna'].PivotItems():
        if item.Name in comunas_seleccionadas:
            item.Visible = True
        else:
            item.Visible = False

    field_columns = {}
    field_columns['dias_transcurridos'] = pt.PivotFields("DIAS_TRANSCURRIDOS")
    field_columns['dias_transcurridos'].Orientation = 2

    field_rows = {}
    field_rows['area_responsable_orden'] = pt.PivotFields("AREA_RESPONSABLE_ORDEN")
    field_rows['area_responsable_orden'].Orientation = 1
    field_rows['area_responsable_orden'].Position = 1


    field_values = {}
    field_values['n_solicitud'] = pt.PivotFields("N_SOLICITUD")
    field_values['n_solicitud'].Orientation = 4
    field_values['n_solicitud'].Function = 1 

    field_filters['estado_solicitud'] = pt.PivotFields("ESTADO_SOLICITUD")
    field_filters['estado_solicitud'].Orientation = 3
    field_filters['estado_solicitud'].CurrentPage = "registrado"
    
xlApp = win32.Dispatch('Excel.Application')
xlApp.Visible = True
# Obtener la ruta completa del archivo de Excel llamado "Macro" en la carpeta actual
file_path = os.path.join(os.getcwd(), 'Macro.xlsx')

# Abrir el archivo de Excel
wb = xlApp.Workbooks.Open(file_path)
ws_data = wb.Worksheets("Data")
ws_report = wb.Worksheets("Report")
clear_pts(ws_report)
pt_cache = wb.PivotCaches().Create(1, ws_data.Range("A1").CurrentRegion)
pt = pt_cache.CreatePivotTable(ws_report.Range("A1"), "Dev_Proj_Summary")
pt.ColumnGrand = True
pt.RowGrand = True
pt.SubtotalLocation(2) 
pt.RowAxisLayout(1)
pt.TableStyle2 = "PivotStyleMedium2"
insert_pt_field_set1(pt)
ws_report.Range('C:AD').ColumnWidth = 2.5
########################################################################################################################


pt_cache2 = wb.PivotCaches().Create(1, ws_data.Range("AH1").CurrentRegion)

pt2 = pt_cache2.CreatePivotTable(ws_report.Range("AH1"), "TablaDinamica2")

pt2.TableStyle2 = "PivotStyleMedium2"



def insert_pt_field_set2(pt):
    field_filters = {}
    field_filters['comuna'] = pt.PivotFields("COMUNA")
    field_filters['comuna'].Orientation = 3

    comunas_seleccionadas = ["CALLE LARGA", "CATEMU", "RINCONADA", "LOS ANDES", "LLAY LLAY", "SAN FELIPE", "PUTAENDO", "SANTA MARÍA", "PANQUEHUE", "SAN ESTEBAN"]

    for item in field_filters['comuna'].PivotItems():
        if item.Name in comunas_seleccionadas:
            item.Visible = True
        else:
            item.Visible = False

    field_filters['estado_solicitud'] = pt.PivotFields("ESTADO_SOLICITUD")
    field_filters['estado_solicitud'].Orientation = 3
    field_filters['estado_solicitud'].CurrentPage = "registrado"

    field_columns = {}
    field_columns['dias_transcurridos'] = pt.PivotFields("DIAS_TRANSCURRIDOS")
    field_columns['dias_transcurridos'].Orientation = 2

    field_rows = {}
    field_rows['area_responsable_orden'] = pt.PivotFields("AREA_RESPONSABLE_ORDEN")
    field_rows['area_responsable_orden'].Orientation = 1
    field_rows['area_responsable_orden'].Position = 1


    field_values = {}
    field_values['n_solicitud'] = pt.PivotFields("N_SOLICITUD")
    field_values['n_solicitud'].Orientation = 4
    field_values['n_solicitud'].Function = 1 

insert_pt_field_set2(pt2)

def insert_pt_field_set2(pt2):
    field_filters = {}
    field_filters['area_responsable_orden'] = pt2.PivotFields("AREA_RESPONSABLE_ORDEN")
    field_filters['area_responsable_orden'].Orientation = 1

    nombres_seleccionados = ["OFICINA LOS ANDES", "OFICINA SAN FELIPE", "OFICINA LLAY LLAY", "UT - ASIGNACION RECLAMO C.LISBOA", "UT - ASIGNACION RECLAMO E. HERNANDEZ", "UT - ASIGNACION RECLAMO G. MORALES", "UT - ASIGNACION RECLAMO J. CANEO VERA", "UT - ASIGNACION RECLAMO L.GUERRA", "UT - ASIGNACION RECLAMO Y. PEREZ PEREZ" ]

    for item in field_filters['area_responsable_orden'].PivotItems():
        if item.Name in nombres_seleccionados:
            item.Visible = True
        else:
            item.Visible = False
    
insert_pt_field_set2(pt2)

#######################################################################################################################################






