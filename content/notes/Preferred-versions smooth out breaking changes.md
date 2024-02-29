---
tags:
- Software craftsmanship
- explanation
title: Preferred-versions smooth out breaking changes
categories:
date: 2024-02-08
lastMod: 2024-02-08
---
Preferred-versions are a [Hackage](https://hackage.haskell.org/) feature that looks [mostly unused](https://hackage.haskell.org/packages/preferred), whereas it enables a software release strategy that can mitigate the damage caused by API-breaking changes. This article is an attempt to advertise this strategy.

Note that the idea is applicable to any software ecosystem, provided the concept of preferred-versions is implemented by the installer.

API-breaking changes cause conflicts between:

  + users who need the changes as soon as possible;

  + users who don’t care about the changes and perceive them as a migration cost only.

According to the hackage documentation:

> If a range of versions is preferred, it means that the installer won’t install a non-preferred package version unless it is explicitly specified or if it’s the only choice the installer has

We can leverage this feature to create a transition period during which a new version is available only if explicitly requested in the `.cabal` file. As a consequence, early-adopters can enjoy the new API while other users aren’t impacted in their daily workflow. In other words: the new API is opt-in.

To be accurate, here is an example procedure:

  + let `A.B.C.D` be the latest published version (assuming you are following the [Haskell PVP](https://pvp.haskell.org/))

  + release a new version `A.B.C.(D+1)` that only includes additional deprecation markers to warn users about the upcoming breaking change;

  + release a new version `A.(B+1).0.0` that includes the breaking changes

  + on Hackage, set the “Preferred versions” such that `A.B.C.(D+1)` is preferred over `A.(B+1).0.0`

  + after a reasonable time, remove the preferred version so that `A.(B+1).0.0` becomes the new default

As is often the case, one size does not fit all: this strategy may not be appropriate to your project, but it is worth considering.
