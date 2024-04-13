unit Arm.Settings.Common;

interface
uses
    Arm.Singleton
  , Vcl.Forms
  , Vcl.Dialogs
  , System.IniFiles
  , System.SysUtils
  , System.Types
  , System.IOUtils
  , Winapi.Windows
  ;

const
  KeybrdLayoutDefault = 67699721;
  ArmHomeDir = 'Leybasoft';
  ReportExpDir = 'Reports';
  ReportDefaultDir = 'Reports';
  RecomDefaultDir = 'Recom';
  CommonSectName = 'Common';

type
  TSenderObject = (
                  soNil
                  , soFrmMainProg
                  , soFrmStatusPat
                  , soFrmTblDoctor
                  , soFrmConsultation
                  , sofrmFindPat
                  , soFrmRichTxtShow
                  , soFrmTblDrugsSingle
                  , soFrmTblDrugsDual
                  , soFrmReportResearch
                  , soFrmTitulPrint
                  , soFrmBasePrice
                  , sofrmTblPrice
                  , soFrmTblLaborIssue
                  , soFrmBloodHorm
                  , soFrmIFA
                  , soFrmMazProst
                  , soFrmMazUrethraM
                  , soFrmMazUrethraF
                  , soFrmMKB
                  , soFrmOAM
                  , soFrmPCR
                  , soFrmResearchLues
                  , soFrmShedul
                  , soFrmSpermGr
                  , soFrmStLocalisTempl
                  , soFrmStPraesensTempl
                  , soFrmStProstataTempl
                  , soFrmTblAnketa
                  , soFrmTblClinic
                  , soFrmTblDsSingle
                  , soFrmTblDsDual
                  , soFrmTblManipSingle
                  , soFrmTblManipDual
                  , soFrmTblRecomSingle
                  , soFrmTblRecomDual
                  , soFrmTblTown
                  , soFrmAbout
                  , soFrmAIDS
                  , soFrmAllergyChoice
                  , soFrmAnthrDes
                  , soFrmChildDes
                  , soFrmMicUrBactInoc
                  , soFrmProstBactInoc
                  , soFrmUrethBactInoc
                  , soFrmUrinBactInoc
                  , soFrmZPPP
                  , soFrmImgTemplateFour
                  , soFrmImgTemplateSingle
                  , soFrmImgTemplateSix
                  , sofrmItem
                  , soFrmUrScopiaDry
                  , soFrmUrScopiaIrrig
                  , sofrmTblPriceTree
                  , soFrmUZIGenit
                  , soFrmUZIRen
                  , sofrmRecomList
                  , sofrmNodeInfoGroup
                  , sofrmNodeInfoItem
                  , sofrmPayments
                  , sofrmTransferData
                  , sofrmConnect
                  , sofrmSimpleEditor
                  );

  {from here https://www.gunsmoker.ru/2011/04/blog-post.html}
  TSettings = class(TSingleton)
  protected
    constructor Create; override;
  public
    destructor Destroy; override;
  private
    FSettingsFile: TCustomIniFile;
    FSenderObject: TSenderObject;
    FKeybrdLayoutNum: Integer;
    FfrxExp_ExportPath: string;
    FfrxExp_OverwritePrompt: Boolean;
    FfrxExp_OpenAfterExport: Boolean;
    FReportTemplDir: string;
    FRecomTemplDir: string;
  public
    property SettingsFile: TCustomIniFile read FSettingsFile;
    property ReportTemplDir: string read FReportTemplDir write FReportTemplDir;//путь к папке с отчетами
    property RecomTemplDir: string read FRecomTemplDir write FRecomTemplDir;//путь к папке с файлами рекомендаций
    property SenderObject: TSenderObject read FSenderObject write FSenderObject;
    property KeybrdLayoutNum: Integer read FKeybrdLayoutNum write FKeybrdLayoutNum;//номер текущей раскладки

    { TODO : сделать проперти RO }
    property frxExp_ExportPath: string read FfrxExp_ExportPath write FfrxExp_ExportPath;//папка по умолчанию для экспорта отчетов
    property frxExp_OpenAfterExport: Boolean read FfrxExp_OpenAfterExport write FfrxExp_OpenAfterExport;// опция открыть после экспорта"
    property frxExp_OverwritePrompt: Boolean read FfrxExp_OverwritePrompt write FfrxExp_OverwritePrompt;//опция "спрашивать при перезаписи"
    procedure Save(Sender: TObject);
    procedure Load(Sender: TObject);
  end;

  function Settings: TSettings;

implementation

var SettingsDirPath: string;

  {TSettings}
function Settings: TSettings;
begin
  Result := TSettings.GetInstance;
end;

constructor TSettings.Create;
begin
  inherited Create;

  {$IFDEF DEBUG}
  SettingsDirPath:= '';
  FReportTemplDir:= 'c:\proj\armdoc_4\Reports\';
  FRecomTemplDir:= 'c:\proj\armdoc_4\Recom\';
  FfrxExp_ExportPath:= TDirectory.GetCurrentDirectory;

  {$ELSE}
  FReportTemplDir:= Format('%s%s\',[ExtractFilePath(Application.ExeName), ReportDefaultDir]);
  FRecomTemplDir:= Format('%s%s\',[ExtractFilePath(Application.ExeName), RecomDefaultDir]);
  SettingsDirPath:= Format('%s\%s\',[TPath.GetHomePath,ArmHomeDir]);

  if not TDirectory.Exists(SettingsDirPath) then
    if not ForceDirectories(SettingsDirPath) then FfrxExp_ExportPath:= TDirectory.GetCurrentDirectory;

  {$ENDIF}

  FSettingsFile:= TMemIniFile.Create((SettingsDirPath + ChangeFileExt(ExtractFileName(Application.ExeName),'.INI')),
                                                                                                      TEncoding.UTF8);
  SenderObject:= soNil;
  FKeybrdLayoutNum:= KeybrdLayoutDefault;
  frxExp_OpenAfterExport:= True;
  frxExp_OverwritePrompt:= True;

  FfrxExp_ExportPath:= Format('%s\%s\%s\',[TPath.GetHomePath,ArmHomeDir,ReportExpDir]);

  if not TDirectory.Exists(frxExp_ExportPath) then
    if not ForceDirectories(frxExp_ExportPath) then FfrxExp_ExportPath:= '';

  if not TDirectory.Exists(RecomTemplDir) then
    if not ForceDirectories(RecomTemplDir) then FRecomTemplDir:= '';
end;

destructor TSettings.Destroy;
begin
  FSettingsFile.Free;
  inherited Destroy;
end;

procedure TSettings.Load(Sender: TObject);
begin
  if not TObject(Sender).InheritsFrom(TCustomForm) then Exit;
  if not Assigned(SettingsFile) then Exit;

  with TCustomForm(Sender) do
  begin
    case SenderObject of
      soFrmTblDrugsSingle
      , soFrmIFA
      , soFrmMazProst
      , soFrmOAM
      , soFrmPCR
      , soFrmResearchLues
      , soFrmSpermGr
      , soFrmStLocalisTempl
      , soFrmStPraesensTempl
      , soFrmStProstataTempl
      , soFrmTblAnketa
      , soFrmTblDsSingle
      , soFrmTblManipSingle
      , soFrmTblRecomSingle
      , soFrmAbout
      , soFrmAIDS
      , soFrmAllergyChoice
      , soFrmAnthrDes
      , soFrmChildDes
      , soFrmMicUrBactInoc
      , soFrmProstBactInoc
      , soFrmUrethBactInoc
      , soFrmUrinBactInoc
      , soFrmZPPP
      , soFrmUrScopiaDry
      , soFrmUrScopiaIrrig
      , soFrmUZIGenit
      , soFrmUZIRen
      , sofrmNodeInfoGroup
      , sofrmConnect:
        begin
          Top     := SettingsFile.ReadInteger(Name, 'Top_Single', Top);
          Left    := SettingsFile.ReadInteger(Name, 'Left_Single', Left);
        end;
      soFrmMazUrethraM:
        begin
          Top     := SettingsFile.ReadInteger(Name, 'Top_Male', Top);
          Left    := SettingsFile.ReadInteger(Name, 'Left_Male', Left);
        end;
      soFrmMazUrethraF:
        begin
          Top     := SettingsFile.ReadInteger(Name, 'Top_Female', Top);
          Left    := SettingsFile.ReadInteger(Name, 'Left_Female', Left);
        end;
      else
        begin
          case SettingsFile.ReadBool(Name, 'InitMax', WindowState = wsMaximized) of
            True : WindowState := wsMaximized;
            False:
              begin
                WindowState := wsNormal;
                Top     := SettingsFile.ReadInteger(Name, 'Top', Top);
                Left    := SettingsFile.ReadInteger(Name, 'Left', Left);
                Width   := SettingsFile.ReadInteger(Name, 'Width', Width);
                Height  := SettingsFile.ReadInteger(Name, 'Height', Height);
              end;
          end;
        end;
    end;
    FKeybrdLayoutNum:= SettingsFile.ReadInteger(Name, 'KeybrdLayoutNum', KeybrdLayoutNum);
  end;
end;

procedure TSettings.Save(Sender: TObject);
begin
  if not TObject(Sender).InheritsFrom(TCustomForm) then Exit;
  if not Assigned(SettingsFile) then Exit;

  try
    with TCustomForm(Sender) do
    begin
      case SenderObject of
        soFrmTblDrugsSingle
        , soFrmIFA
        , soFrmMazProst
        , soFrmOAM
        , soFrmPCR
        , soFrmResearchLues
        , soFrmSpermGr
        , soFrmStLocalisTempl
        , soFrmStPraesensTempl
        , soFrmStProstataTempl
        , soFrmTblAnketa
        , soFrmTblDsSingle
        , soFrmTblManipSingle
        , soFrmTblRecomSingle
        , soFrmAbout
        , soFrmAIDS
        , soFrmAllergyChoice
        , soFrmAnthrDes
        , soFrmChildDes
        , soFrmMicUrBactInoc
        , soFrmProstBactInoc
        , soFrmUrethBactInoc
        , soFrmUrinBactInoc
        , soFrmZPPP
        , soFrmUrScopiaDry
        , soFrmUrScopiaIrrig
        , soFrmUZIGenit
        , soFrmUZIRen
        , sofrmNodeInfoGroup
        , sofrmConnect:
          begin
            SettingsFile.WriteInteger (Name, 'Top_Single', Top);
            SettingsFile.WriteInteger (Name, 'Left_Single', Left);
          end;
      soFrmMazUrethraM:
        begin
          SettingsFile.WriteInteger(Name, 'Top_Male', Top);
          SettingsFile.WriteInteger(Name, 'Left_Male', Left);
        end;
      soFrmMazUrethraF:
        begin
          SettingsFile.WriteInteger(Name, 'Top_Female', Top);
          SettingsFile.WriteInteger(Name, 'Left_Female', Left);
        end;

        else
          begin
            SettingsFile.WriteBool(Name, 'InitMax', WindowState = wsMaximized);
            if (WindowState <> wsMaximized) then
            begin
              SettingsFile.WriteInteger (Name, 'Top', Top);
              SettingsFile.WriteInteger (Name, 'Left', Left);
              SettingsFile.WriteInteger (Name, 'Width', Width);
              SettingsFile.WriteInteger (Name, 'Height', Height);
            end;
          end;
      end;

      SettingsFile.WriteInteger (Name, 'KeybrdLayoutNum', KeybrdLayoutNum);
    end;
  finally
    SettingsFile.UpdateFile;
  end;
end;

end.
