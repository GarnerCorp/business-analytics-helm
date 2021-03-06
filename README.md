# Business Analytics Helm
This respository contains a helm chart for running Garner Spark and Thrift Server, using a modified version of [Bitnami's Spark Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/spark).

## Using the Chart
The chart can be added as a dependency to other charts by adding this to your Chart.yaml:
```
dependencies:
- name: spark
  version: x.x.x
  repository: https://garnercorp.github.io/business-analytics-helm/
```

## Updating the Chart
1. Make changes to the chart
1. Bump the version in Chart.yaml
1. Commit to master. The chart should be released to the [gh-pages](https://github.com/GarnerCorp/business-analytics-helm/tree/gh-pages) branch, in the helm repository located at https://garnercorp.github.io/business-analytics-helm/

## Force a Release
:warning: Only those with direct write access to this repo will be able to force a release.

:warning: You will need to make sure you have updated the chart version to a new version that hasn't been released yet before running this. It will package your local changes, so make sure they are merged to master before running.

1. Install [chart-releaser](https://github.com/helm/chart-releaser#installation)
1. Get a github personal access token with repo scope
1. Run:
    ```
    ./scripts/release-chart.sh $GITHUB_PAT
    ```
1. The chart should be released to the [gh-pages](https://github.com/GarnerCorp/business-analytics-helm/tree/gh-pages) branch, in the helm repository located at https://garnercorp.github.io/business-analytics-helm/
