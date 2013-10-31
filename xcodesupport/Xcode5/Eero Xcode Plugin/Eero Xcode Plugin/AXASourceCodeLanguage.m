//
//  AXASourceCodeLanguage.m
//
//  Developed by: Andreas (Andy) Arvanitis
//                The Eero Programming Language
//                http://eerolanguage.org
//
//  Copyright (c) 2013, Andreas Arvanitis
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//      * Redistributions of source code must retain the above copyright
//        notice, this list of conditions and the following disclaimer.
//      * Redistributions in binary form must reproduce the above copyright
//        notice, this list of conditions and the following disclaimer in the
//        documentation and/or other materials provided with the distribution.
//      * Neither the name of the eerolanguage.org nor the
//        names of its contributors may be used to endorse or promote products
//        derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL ANDREAS ARVANITIS BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
#import "AXASourceCodeLanguage.h"

@protocol AXASourceCodeLanguage_PrivateXcodeMethods
  // DVTSourceCodeLanguage
  + (id) sourceCodeLanguageWithIdentifier: (id) identifier;
@end


//==================================================================================================
  @implementation AXASourceCodeLanguage
//==================================================================================================
  {
  Class SourceCodeLanguage;
  }

  //------------------------------------------------------------------------------------------------
  - (id) init {
  //------------------------------------------------------------------------------------------------
    if (self = [super init]) {
      SourceCodeLanguage = NSClassFromString(@"DVTSourceCodeLanguage");
    }
    return self;
  }

  //------------------------------------------------------------------------------------------------
  - (BOOL) isKindOfClass: (Class) aClass {
  //------------------------------------------------------------------------------------------------
    return (aClass == SourceCodeLanguage) ? YES : [super isKindOfClass: aClass];
  }

  //------------------------------------------------------------------------------------------------
  - (BOOL) conformsToLanguage: (id) language {
  //------------------------------------------------------------------------------------------------
    // Make this stand-in class part of the C family. This allows rich autocompletion.
    id C = [SourceCodeLanguage sourceCodeLanguageWithIdentifier: @"Xcode.SourceCodeLanguage.C"];
    return (language == C) ? YES : NO;
  }

  //------------------------------------------------------------------------------------------------
  - (BOOL) supportsIndentation {
  //------------------------------------------------------------------------------------------------
    return YES;
  }

@end
