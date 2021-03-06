#ifndef MATERIALXEBUBBLETESTER_H
#define MATERIALXEBUBBLETESTER_H

#include "GeneralPostprocessor.h"

class MaterialXeBubbleTester;

template<>
InputParameters validParams<MaterialXeBubbleTester>();

class MaterialXeBubbleTester : public GeneralPostprocessor
{
public:
  MaterialXeBubbleTester(const InputParameters & parameters);

	virtual ~MaterialXeBubbleTester() {};
	virtual void initialize() {};
  virtual void execute() {};
  virtual PostprocessorValue getValue();

protected:
	const Real _temp;
	const Real _sigma;

	const PostprocessorValue & _m_mag;
};

#endif // MATERIALXEBUBBLETESTER_H
