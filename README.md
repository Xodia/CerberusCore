<p align="center">
  <img width="300" height="300" src="https://i.imgur.com/LE8qOqw.png">
</p>

# Cerberus Core 🐶🐶🐶

Cerberus is a tool helping to generate specific frontend localization files from a json file.
The CerberusCore Swift package is design to share the core structure of Cerberus JSON language.

## Input JSON Structure

The structure is design like this:
- The top structure is a Module, think of it like the parent feature name. This module can contains a list of submodules which on a frontend consist of a screen. To each of those submodules, there is a list of languages handled with their copies inside it. 

Copies can be interpolated (copies with parameters) and plural is also handled.

### Parent structure

```
{
    "module": "Feature",
    "submodules": [SubModule]
}
```

### SubModule structure

```
{
    "module": "SubFeature",
    "language": [Language]
}
```

### Language structure

```
{
    "identifier": "en",
    "copy": [Copy],
    "array": [CopyArray]
}
```

### Copy Structure

```
{
    "key": "copy_key",
    "value": {
        "value": "copy_value",
        "parameters": [Parameter]?
    }
}
```

### Copy Array Structure

```
{
    "key": "copy_key",
    "items": [Item]
}
```


### Item Structure

```
{
    "value": "item_value"
}
```

### Parameter Structure

```
{
    "name": "parameter_name",
    "type": "parameter_type", // integer or float or string
    "variants": [Variant]
}
```

### Variant structure

```
{
    "variant": "__parameter_type__ investments",
    "qualifier": "one" // zero, one, two, few, many, other
}
```


### Important rules

#### Single copy
1. A copy without parameters is a single copy. Set parameters to `null` to do a single copy. 

#### Plurals
1. Plurals needs to have at least two variants and the qualifier `other` needs to be present.
2. Parameters for plural needs to be in the format `__parameter_name__`. The parameter name is followed by `__` on each side of the parameter name.


### Examples 

#### Single Copy

```
{
    "key": "navigation",
    "value": {
        "value": "Home",
        "parameters": null
    }
}
```

#### Plural

```
{
  "key": "select_type_investment",
  "value": {
      "value": "Select __from__ of __outoff__",
      "parameters": [
          {
              "name": "from",
              "type": "integer",
              "variants": [
                  {
                      "variant": "__from__ types",
                      "qualifier": "other"
                  },
                  {
                      "variant": "__from__ type",
                      "qualifier": "one"
                  }
              ]
          },
          {
              "name": "outoff",
              "type": "integer",
              "variants": [
                  {
                      "variant": "__outoff__ investments",
                      "qualifier": "other"
                  },
                  {
                      "variant": "__outoff__ investment",
                      "qualifier": "one"
                  }
              ]
          }
      ]
  }
}
```

#### JSON Example

[JSON Example](Example/Popup.json)
