﻿// Eduardo - 10/08/2024
unit chat.tipos;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes,
  System.UITypes,
  FMX.Types,
  FMX.Graphics,
  FMX.Forms;

type
  TLado = (Direito = Integer(TAlignLayout.Right), Esquerdo = Integer(TAlignLayout.Left));
  TStatus = (Pendente, Recebida, Visualizada);
  TLimite = (Inferior, Superior);
  TTipo = (Texto, Imagem, Arquivo, MensagemAudio);
  TEvento = procedure(Frame: TFrame) of object;
  TEventoMouseDown = procedure(Frame: TFrame; Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single) of object;
  TEventoLimite = procedure(Limite: TLimite) of object;

  TConteudo = record
  public
    Tipo: TTipo;
    Conteudo: String;
    Nome: String;
    Extensao: String;
    constructor Create(ATipo: TTipo; AConteudo: String);
  end;

  TEventoEnvio = procedure(Conteudos: TArray<TConteudo>) of object;

  TFileSelected = record
    MimeType: String;
    Extension: String;
    Name: String;
    Path: String;
    Data: TMemoryStream;
    constructor Create(const APath: String);
  end;

const
  TipoArquivoImagem: Array of String = ['bmp', 'jpg', 'png', 'lottie', 'tgs', 'gif', 'webp', 'svg'];

implementation

uses
  System.SysUtils;

{ TConteudo }

constructor TConteudo.Create(ATipo: TTipo; AConteudo: String);
begin
  Tipo     := ATipo;
  Conteudo := AConteudo;
end;

{ TFileSelected }

constructor TFileSelected.Create(const APath: String);
begin
  Path := APath;
  Extension := ExtractFileExt(APath).ToLower;
end;

end.
