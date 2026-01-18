from setuptools import setup, find_packages

setup(
    name="DEV",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "numpy==2.2.2",
        "pandas==2.2.3",
        "scipy==1.15.3",
        "matplotlib==3.10.0",
        "seaborn==0.13.2",
        "jupyterlab==4.2.7",
        "notebook==7.2.2",
        "requests==2.31.0",
    ],
)
