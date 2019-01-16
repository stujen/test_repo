import versioneer

from setuptools import setup, find_packages
from setuptools.command.test import test as TestCommand


PACKAGE_NAME = "U_FaIR"
AUTHOR = "Stuart Jenkins"
EMAIL = "stuart.a.jenkins@gmail.com"
URL = "https://github.com/stujen/Universal-FAIR"

DESCRIPTION = (
    "5-equation Finite Amplitude Impulse Response model implementation"
)
README = "README.md"

SOURCE_DIR = "U_FaIR"

with open(README, "r") as readme_file:
    README_TEXT = readme_file.read()


class UFair(TestCommand):
    def finalize_options(self):
        TestCommand.finalize_options(self)
        self.test_args = []
        self.test_suite = True

    def run_tests(self):
        import pytest

        pytest.main(self.test_args)


cmdclass = versioneer.get_cmdclass()
cmdclass.update({"test": UFair})

setup(
    name=PACKAGE_NAME,
    version=versioneer.get_version(),
    description=DESCRIPTION,
    long_description=README_TEXT,
    long_description_content_type="text/markdown",
    author=AUTHOR,
    author_email=EMAIL,
    url=URL,
    # license="uknown",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Operating System :: OS Independent",
        # "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3.6",
    ],
    keywords=["simple", "climate", "model", "fair"],
    packages=find_packages(SOURCE_DIR),  # no tests/docs in `src` so don't need exclude
    package_dir={"": SOURCE_DIR},
    install_requires=["numpy", "scipy"],
    extras_require={
        "tests": ["pytest>=4.1.1", "pytest-cov", "codecov"],
    },
)
