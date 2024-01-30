{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "types-pytz";
  version = "2023.4.0.20240130";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-M2dqkL8EsZ+Swz7shYETa+ovNd3RJ1nleaYkoAb9OHo=";
  };

  # Modules doesn't have tests
  doCheck = false;

  pythonImportsCheck = [
    "pytz-stubs"
  ];

  meta = with lib; {
    description = "Typing stubs for pytz";
    homepage = "https://github.com/python/typeshed";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
