# Universal FaIR

| Repository Overview |   |   |   |
|---------------------|---|---|---|
| Basics | [![Python Versions](https://img.shields.io/pypi/pyversions/Universal-FAIR.svg)](https://pypi.org/project/Universal-FAIR/) | [![License](https://img.shields.io/github/license/stujen/Universal-FAIR.svg)](https://pypi.org/project/Universal-FAIR/) | [![Docs](https://readthedocs.org/projects/ufair/badge/?version=latest)](https://ufair.readthedocs.io/en/latest/) |
| Citations | [![Zenodo](https://zenodo.org/badge/123.svg)](https://zenodo.org/badge/latestdoi/123) |   |   |
| Repository Health | [![Build Status](https://travis-ci.com/stujen/Universal-FAIR.svg?branch=master)](https://travis-ci.com/stujen/Universal-FAIR) | [![Codecov](https://codecov.io/gh/stujen/Universal-FAIR/branch/master/graph/badge.svg)](https://codecov.io/gh/stujen/Universal-FAIR) | Codacy |
| Latest Releases | [![PyPI](https://img.shields.io/pypi/v/ufair.svg)](https://pypi.org/project/ufair/) | [![Latest Version](https://img.shields.io/github/tag/stujen/Universal-FAIR.svg)](https://github.com/stujen/Universal-FAIR/releases) |   |
| Latest Activity | [![Contributors](https://img.shields.io/github/contributors/stujen/Universal-FAIR.svg)](https://github.com/stujen/Universal-FAIR/graphs/contributors) | [![Latest Commit](https://img.shields.io/github/last-commit/stujen/Universal-FAIR.svg)](https://github.com/stujen/Universal-FAIR/commits/master) | [![Commits Since Last Release](https://img.shields.io/github/commits-since/stujen/Universal-FAIR/latest.svg)](https://github.com/stujen/Universal-FAIR/commits/master) |

This is the repository for the 5-equation implementation of a Finite Amplitude Impulse Response model. Designed by Stuart Jenkins, Nicholas Leach, Bill Wu and based on the FaIR model written by Richard Millar, Zebedee Nicholls, Pierre Friedlingstein and Myles Allen. (R. Millar et al., 2017)

## Design

Model design based on the implementation of 5-equation globally averaged climate model and deliberately written in as transparent and readable form as possible. Model based on the FaIR model (R. Millar et al., 2017), which in turn is based on the IPCC AR5-IR model (Mhyre et al., 2013). Difference is the way a state dependence is built into the model. In this design we employ a derived functional form to apporximate the integrated Impulse Response Function (iIRF), where in other implementations of this code more sophisticated efforts are made to approximate the iIRF value.

This simplification aims to create a transparent globally averaged climate emulator which is non-code specific. Implementations of the 5 equations will be written in a number of languages and programs in due course. The simplicity of the equations means implementations can be provided as an excel sheet, allowing wide ranging use in policy and economic settings.

The model uses the 5 equations to implement the behaviour from emission-to-temperature-response for all major greenhouse gases and aerosols. Appropriate tunings and parameter sets will be made available in due course.


## References

Millar, Richard J., Zebedee R. Nicholls, Pierre Friedlingstein, and Myles R. Allen. ‘A Modified Impulse-Response Representation of the Global near-Surface Air Temperature and Atmospheric Concentration Response to Carbon Dioxide Emissions’. Atmospheric Chemistry and Physics 17, no. 11 (16 June 2017): 7213–28. https://doi.org/10.5194/acp-17-7213-2017.

Myhre, G., D. Shindell, F.-M. Bréon, W. Collins, J. Fuglestvedt, J. Huang, D. Koch, J.-F. Lamarque, D. Lee, B. Mendoza, T. Nakajima, A. Robock, G. Stephens, T. Takemura and H. Zhang, 2013: Anthropogenic and Natural Radiative Forc- ing. In: Climate Change 2013: The Physical Science Basis. Contribution of Working Group I to the Fifth Assessment Report of the Intergovernmental Panel on Climate Change [Stocker, T.F., D. Qin, G.-K. Plattner, M. Tignor, S.K. Allen, J. Boschung, A. Nauels, Y. Xia, V. Bex and P.M. Midgley (eds.)]. Cambridge University Press, Cambridge, United Kingdom and New York, NY, USA.
