#include "BubbleBase.h"

template<>
InputParameters validParams<BubbleBase>()
{
  InputParameters params = validParams<Kernel>();

  params.addRequiredCoupledVar("coupled_conc", "List of coupled concentration variables.");
  params.addRequiredCoupledVar("coupled_rad", "List of coupled radius variables.");
  params.addRequiredParam<std::vector<Real> >("coupled_atoms", "List of atom sizes for coupled variables.");
  params.addRequiredParam<std::vector<Real> >("coupled_widths", "List of group sizes");

  return params;
}


BubbleBase::BubbleBase(const InputParameters & parameters)
  :Kernel(parameters),
  _names(getParam<std::vector<VariableName> >("coupled_conc")),
  _this_var(getParam<NonlinearVariableName>("variable")),
  _atoms(getParam<std::vector<Real> >("coupled_atoms")),
  _widths(getParam<std::vector<Real> >("coupled_widths"))
{
	_G = coupledComponents("coupled_conc");
  if ( _G != coupledComponents("coupled_rad") )
    mooseError("From BubbleBase: The number of coupled concentrations does not match coupled radii.");
  if ( _G != _atoms.size() )
    mooseError("From BubbleBase: The number of coupled concentrations does not match atom sizes list.");

  for ( unsigned int i=0; i<_G; ++i )
  {
    _c.push_back( &coupledValue("coupled_conc", i) );
    _r.push_back( &coupledValue("coupled_rad", i) );
  }

  // Determine which group current kernel acts on
  _g = -1;
  for ( unsigned int i=0; i<_G; ++i )
  {
    if ( _names[i].compare(_this_var) == 0 )
    {
      _g = i;
      break;
    }
  }
  if (_g == -1)
    mooseError("From BubbleBase: Variable not found in coupled_conc list. Check the list.");

  mooseDoOnce( displayBubbleInfo() );
}


Real
BubbleBase::computeQpResidual()
{
  Real losses(0);
  Real gains(0);
  calcLosses(losses, false);
  calcGains(gains, false);

  return -( gains - losses ) * _test[_i][_qp];
}


Real
BubbleBase::computeQpJacobian()
{
  Real losses(0);
  Real gains(0);
  calcLosses(losses, true);
  calcGains(gains, true);

  return -( gains - losses ) * _phi[_j][_qp] * _test[_i][_qp];
}


void
BubbleBase::displayBubbleInfo()
{
  std::cout.precision(6);
  std::cout << std::scientific;
  std::cout << "=======================================\n";
  std::cout << "    --< BUCK Bubble Information >--     \n";
  std::cout << "=======================================\n";
  std::cout << " group\t| avg atoms\t| width\n";
  std::cout << "--------+---------------+--------------\n";
  for (int i=0; i<_G; ++i)
    std::cout << " " << i+1 << "\t| " << _atoms[i] << "\t| " << _widths[i] << "\n";
  std::cout << "=======================================\n" << std::endl;
}
