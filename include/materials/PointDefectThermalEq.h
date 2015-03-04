#ifndef POINTDEFECTTHERMALEQ_H
#define POINTDEFECTTHERMALEQ_H

#include "Material.h"

class PointDefectThermalEq;

template<>
InputParameters validParams<PointDefectThermalEq>();

class PointDefectThermalEq : public Material
{
public:
  PointDefectThermalEq(const std::string & name,
                         InputParameters parameters);

protected:
  virtual void computeQpProperties();

  void calcUCConc();
  void calcUO2Conc();

  VariableValue & _temp;
  const int _fueltype;
  const Real _x;

  const Real _kB;

  MaterialProperty<Real> & _X_vo;
  MaterialProperty<Real> & _X_io;
  MaterialProperty<Real> & _X_vu;
  MaterialProperty<Real> & _X_iu;
};

#endif // POINTDEFECTTHERMALEQ_H
