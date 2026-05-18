<div align="center">
  <img alt="logo" src="logo.png" width="256" />
  <h1>
    snippets-javascript
  </h1>
  <p>
    Collection of JS code snippets for JavaScript in VS Code.
  </p>
</div>

<hr>

<p align="center" vertical-align="center">
  <a href="https://marketplace.visualstudio.com/items?itemName=mensebdev.snippets-javascript">
    <img alt="VS Code Marketplace" src="https://img.shields.io/badge/Marketplace-Snippets%20JavaScript-blue?logo=visualstudiocode" />
  </a>
  <a href="https://github.com/MenSebDev/vscode-snippets/blob/main/snippets/javascript/javascript/LICENSE">
    <img alt="License" src="https://img.shields.io/badge/license-MIT-green" />
  </a>
</p>

<hr>

## Table of contents <!-- omit from toc -->

- [Installation](#installation)
- [Usage](#usage)
- [Categories](#categories)
- [Snippets Overview](#snippets-overview)
  - [Modules](#modules)
- [Snippets Details](#snippets-details)
  - [Modules](#modules-1)

## Installation

You can install this extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=mensebdev.snippets-javascript).

You can install directly via VS Code:

1. Open the **Extensions** view.
2. Search for **snippets-javascript**.
3. Click **Install** on the **Snippets JavaScript** extension.

## Usage

Type the snippet prefix and press `Enter` or `Tab` or select it from the IntelliSense menu.

## Categories

All snippet prefixes in this extension follow a consistent pattern to make them easy to remember.

| Letter | Category  |
|:------:|-----------|
| `imp` | **Imports**  |
| `exp` | **Exports**  |

## Snippets Overview

Here is the overview of the list of snippets included in this collection.

<!-- OVERVIEW:OPENING -->

### Modules

| Prefix | Description |
|--------|-------------|
| `["imp","impd"]` | Imports a default export from a module. |
| `impn` | Imports a named export from a module. |
| `impna` | Imports a named export with an alias from a module. |
| `impns` | Imports all exports from a module as a namespace object. |
| `impse` | Imports a module for its side effects only. |
| `impdn` | Imports a default export and named exports from a module. |
| `impdns` | Imports a default export and all exports as a namespace object from a module. |
| `["exp","expd"]` | Exports a default value from the module. |
| `expn` | Exports named bindings from the current module. |
| `expna` | Exports a binding with an alias from the current module. |
| `expnd` | Exports a named binding as the default export. |
| `expc` | Exports a const declaration. |
| `expl` | Exports a let declaration. |
| `expf` | Exports a function declaration. |
| `expdf` | Exports a default function declaration. |
| `expcl` | Exports a class declaration. |
| `expdcl` | Exports a default class declaration. |
| `expg` | Exports a generator function declaration. |
| `expdg` | Exports a default generator function declaration. |
| `exprd` | Re-exports the default export from another module. |
| `exprda` | Re-exports the default export from another module with an alias. |
| `exprn` | Re-exports named exports from another module. |
| `exprna` | Re-exports a named export with an alias from another module. |
| `exprns` | Re-exports all exports from another module as a namespace. |
| `exprall` | Re-exports all named exports from another module. |
<!-- OVERVIEW:CLOSING -->

## Snippets Details

Here is the detailed list of snippets included in this collection. They are represented with their tab stops. The last tab stop being the `$0`.

<!-- SNIPPETS:OPENING -->

### Modules

---

**Prefix:** `["imp","impd"]`  
**Description:** Imports a default export from a module.  
**Output:**

```txt
import ${1:defaultExport} from "${2:module-name}";
$0
```

---

**Prefix:** `impn`  
**Description:** Imports a named export from a module.  
**Output:**

```txt
import { ${1:export} } from "${2:module-name}";
$0
```

---

**Prefix:** `impna`  
**Description:** Imports a named export with an alias from a module.  
**Output:**

```txt
import { ${1:export} as ${2:alias} } from "${3:module-name}";
$0
```

---

**Prefix:** `impns`  
**Description:** Imports all exports from a module as a namespace object.  
**Output:**

```txt
import * as ${1:name} from "${2:module-name}";
$0
```

---

**Prefix:** `impse`  
**Description:** Imports a module for its side effects only.  
**Output:**

```txt
import "${1:module-name}";
$0
```

---

**Prefix:** `impdn`  
**Description:** Imports a default export and named exports from a module.  
**Output:**

```txt
import ${1:defaultExport}, { ${2:export} } from "${3:module-name}";
$0
```

---

**Prefix:** `impdns`  
**Description:** Imports a default export and all exports as a namespace object from a module.  
**Output:**

```txt
import ${1:defaultExport}, * as ${2:name} from "${3:module-name}";
$0
```

---

**Prefix:** `["exp","expd"]`  
**Description:** Exports a default value from the module.  
**Output:**

```txt
export default ${1:expression};
$0
```

---

**Prefix:** `expn`  
**Description:** Exports named bindings from the current module.  
**Output:**

```txt
export { ${1:name1} };
$0
```

---

**Prefix:** `expna`  
**Description:** Exports a binding with an alias from the current module.  
**Output:**

```txt
export { ${1:variable1} as ${2:name1} };
$0
```

---

**Prefix:** `expnd`  
**Description:** Exports a named binding as the default export.  
**Output:**

```txt
export { ${1:name1} as default };
$0
```

---

**Prefix:** `expc`  
**Description:** Exports a const declaration.  
**Output:**

```txt
export const ${1:name} = ${2:value};
$0
```

---

**Prefix:** `expl`  
**Description:** Exports a let declaration.  
**Output:**

```txt
export let ${1:name} = ${2:value};
$0
```

---

**Prefix:** `expf`  
**Description:** Exports a function declaration.  
**Output:**

```txt
export function ${1:functionName}(${2:params}) {
 $0
}
```

---

**Prefix:** `expdf`  
**Description:** Exports a default function declaration.  
**Output:**

```txt
export default function ${1:functionName}(${2:params}) {
 $0
}
```

---

**Prefix:** `expcl`  
**Description:** Exports a class declaration.  
**Output:**

```txt
export class ${1:ClassName} {
 $0
}
```

---

**Prefix:** `expdcl`  
**Description:** Exports a default class declaration.  
**Output:**

```txt
export default class ${1:ClassName} {
 $0
}
```

---

**Prefix:** `expg`  
**Description:** Exports a generator function declaration.  
**Output:**

```txt
export function* ${1:generatorFunctionName}(${2:params}) {
 $0
}
```

---

**Prefix:** `expdg`  
**Description:** Exports a default generator function declaration.  
**Output:**

```txt
export default function* ${1:generatorFunctionName}(${2:params}) {
 $0
}
```

---

**Prefix:** `exprd`  
**Description:** Re-exports the default export from another module.  
**Output:**

```txt
export { default } from "${1:module-name}";
$0
```

---

**Prefix:** `exprda`  
**Description:** Re-exports the default export from another module with an alias.  
**Output:**

```txt
export { default as ${1:name1} } from "${2:module-name}";
$0
```

---

**Prefix:** `exprn`  
**Description:** Re-exports named exports from another module.  
**Output:**

```txt
export { ${1:name1} } from "${2:module-name}";
$0
```

---

**Prefix:** `exprna`  
**Description:** Re-exports a named export with an alias from another module.  
**Output:**

```txt
export { ${1:import1} as ${2:name1} } from "${3:module-name}";
$0
```

---

**Prefix:** `exprns`  
**Description:** Re-exports all exports from another module as a namespace.  
**Output:**

```txt
export * as ${1:name} from "${2:module-name}";
$0
```

---

**Prefix:** `exprall`  
**Description:** Re-exports all named exports from another module.  
**Output:**

```txt
export * from "${1:module-name}";
$0
```

---
<!-- SNIPPETS:CLOSING -->
