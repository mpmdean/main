FROM jupyter/scipy-notebook

LABEL maintainer="Mark Dean <mdean@bnl.gov>"

# pytables shoudl be included upstream
RUN conda install --quiet --yes \
    fabio \
    lmfit \
    numdifftools \
    phonopy \
    pybroom \
    pyfai \
    pymatgen \
    pymca \
    pytables \
    scikit-image \
    seekpath \
    silx \
    xrayutilities

RUN pip install \
  git+https://github.com/scikit-beam/scikit-beam.git \
  git+https://github.com/mpmdean/h5file.git \
  git+https://github.com/mpmdean/pymcaspec.git \
  git+https://github.com/mpmdean/fitting_functions.git
