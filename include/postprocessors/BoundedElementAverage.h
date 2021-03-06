#ifndef BOUNDEDELEMENTAVERAGE_H
#define BOUNDEDELEMENTAVERAGE_H

#include "ElementAverageValue.h"

class BoundedElementAverage;

template<>
InputParameters validParams<BoundedElementAverage>();

class BoundedElementAverage : public ElementAverageValue
{
public:
  BoundedElementAverage(const InputParameters & parameters);

  virtual void execute();

};

#endif // BOUNDEDELEMENTAVERAGE_H
