@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Animais'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_JARAP_ANIMAL
  as projection on ZI_JARAP_ANIMAL
{
  key Id,
      Nome,
      Idade,
      Especie,
      Sexo
}
