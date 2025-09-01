@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic - Animais'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_JARAP_ANIMAL
  as select from zjatanimal
{
  key id      as Id,
      nome    as Nome,
      idade   as Idade,
      especie as Especie,
      sexo    as Sexo
}
